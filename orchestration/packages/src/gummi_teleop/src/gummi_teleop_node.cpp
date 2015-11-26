#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/JointState.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/Float64.h>

#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

#include <kdl_parser/kdl_parser.hpp>

#include <kdl/chain.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <kdl/chainiksolvervel_pinv.hpp>
#include <kdl/frames.hpp>

#include <angles/angles.h>

class GummiTeleop
{
public:
  GummiTeleop();

private:
  void initializeJointPublishers();
  void advertiseJointPublishers();
  void desiredCallback(const geometry_msgs::Twist::ConstPtr& desired);
  void jointStateCallback(const sensor_msgs::JointState::ConstPtr& joint_state_in);
  void buttonCallback(const sensor_msgs::Joy::ConstPtr& joy_in);
  geometry_msgs::Twist scaleDesired(geometry_msgs::Twist desired);
  void calculateDesiredJointVelocity(geometry_msgs::Twist desired);
  bool isZero(geometry_msgs::Twist vel);
  void publishJointVelocities();
  void printDesired(geometry_msgs::Twist desired);
  void printJointStateIn(sensor_msgs::JointState joint_state_in);
  bool checkIfConnectedToRobot();
  void processButtonPress();
  double limitJointVelocity(double vel, double max);

  ros::NodeHandle nh_;

  int linear_, angular_, num_joints_, debug_mode_;
  double l_scale_, a_scale_;
  ros::Publisher joint_cmd_pub_;
  ros::Publisher gripper_pub_;
  ros::Subscriber desired_sub_, joint_state_sub_, button_sub_;
  std::vector<std::string> joint_names_;
  std::vector<double> current_joint_positions_;
  bool received_joint_positions_;
  bool button1_, button2_;
  std::vector<double> joint_stiffnesses_;

  moveit::core::RobotModelPtr kinematic_model_;
  moveit::core::RobotStatePtr kinematic_state_;
  const moveit::core::JointModelGroup* joint_model_group_;
  ros::Time timeOfLastJointState_;
  bool passive_wrist_;
  bool equilibrium_control_;
  bool stiff_arm_;
  ros::Time time_last_button1_;
  ros::Time time_last_button2_;
  bool integrate_cartesian_pose_;
  bool have_started_integrating_;
  KDL::Frame F_integrated_;
  double control_gain_;
  std::vector<double> desired_joint_velocities_;
  int zero_counter_;
  geometry_msgs::Twist zero_vel_;
  geometry_msgs::Twist last_vel_;
  double max_joint_vel_;
  double min_joint_vel_;

  KDL::ChainFkSolverPos_recursive* fk_solver_;
  KDL::ChainIkSolverVel_pinv* ik_solver_;

};

GummiTeleop::GummiTeleop():
  linear_(1),
  angular_(2)
{

  nh_.param("axis_linear", linear_, linear_);
  nh_.param("axis_angular", angular_, angular_);
  nh_.param("scale_angular", a_scale_, a_scale_);
  nh_.param("scale_linear", l_scale_, l_scale_);
  num_joints_ = 6; // TODO: INPUT PARAMETER
  debug_mode_ = 0; // TODO: INPUT PARAMETER
  control_gain_ = 0.1; // TODO: INPUT PARAMETER
  max_joint_vel_ = 0.04; // TODO: INPUT PARAMETER
  received_joint_positions_ = false;
  button1_ = 0;
  button2_ = 0;
  passive_wrist_ = false;
  equilibrium_control_ = false;
  stiff_arm_  = false;
  time_last_button1_ = ros::Time::now();
  time_last_button2_ = ros::Time::now();
  have_started_integrating_ = false;
  zero_counter_ = 0;
  zero_vel_.linear.x = 0.0;
  zero_vel_.linear.y = 0.0;
  zero_vel_.linear.z = 0.0;
  zero_vel_.angular.x = 0.0;
  zero_vel_.angular.y = 0.0;
  zero_vel_.angular.z = 0.0;
  last_vel_ = zero_vel_; 

  robot_model_loader::RobotModelLoader robot_model_loader("robot_description"); 
  kinematic_model_ = robot_model_loader.getModel();
  ROS_INFO("Model frame: %s", kinematic_model_->getModelFrame().c_str());  

  KDL::Tree kdl_tree;
  KDL::Chain chain;
  ros::NodeHandle node;
  std::string robot_desc_string;
  node.param("robot_description", robot_desc_string, std::string());
  if (!kdl_parser::treeFromString(robot_desc_string, kdl_tree)){
    ROS_ERROR("Failed to construct kdl tree");
  }

  kdl_tree.getChain("base_link", "tool", chain);
  fk_solver_ = new KDL::ChainFkSolverPos_recursive(chain);
  ik_solver_ = new KDL::ChainIkSolverVel_pinv(chain);

  const std::vector<std::string>&  j_n = kinematic_model_->getJointModelNames(); 
  joint_names_.assign(j_n.begin() + 1,j_n.end() - 2); //TODO
  assert(joint_names_.size() == num_joints_);

  for(int i = 0; i < num_joints_; i++) {
    joint_stiffnesses_.push_back(0.1);
    desired_joint_velocities_.push_back(0.0);
    current_joint_positions_.push_back(0.0);
  }

  gripper_pub_ = nh_.advertise<std_msgs::Float64>("teleop/gripper", 1);
  joint_cmd_pub_ = nh_.advertise<sensor_msgs::JointState>("teleop/joint_commands", 1);

  joint_state_sub_ = nh_.subscribe<sensor_msgs::JointState>("teleop/joint_states", 10, &GummiTeleop::jointStateCallback,this);
  desired_sub_ = nh_.subscribe<geometry_msgs::Twist>("teleop/cmd_vel", 10, &GummiTeleop::desiredCallback,this);
  button_sub_ = nh_.subscribe<sensor_msgs::Joy>("teleop/buttons", 10, &GummiTeleop::buttonCallback,this);

}

void GummiTeleop::desiredCallback(const geometry_msgs::Twist::ConstPtr& desired)
{
 
  if(debug_mode_) printDesired(*desired);
  geometry_msgs::Twist vel = scaleDesired(*desired);

  bool connected = checkIfConnectedToRobot();
  if(connected) {

    if(!received_joint_positions_) {

      ros::Duration(2.0).sleep();

      printf("Received initial pose OK, starting robot control!\n");
      received_joint_positions_ = true;

    }
    else {
      
      if(isZero(vel)) {
	zero_counter_++;
	if(zero_counter_ > 10) {
	  vel = zero_vel_;
	}
	else {
	  vel = last_vel_;
	}
      }
      else {
	zero_counter_ = 0;
      }
      calculateDesiredJointVelocity(vel);

      publishJointVelocities();

      last_vel_ = vel;

    }
    
  }
  else {
    printf("Warning: not connected to robot, not sending command.\n");
    received_joint_positions_ = false;
    have_started_integrating_ = false;
  }
  
}

void GummiTeleop::jointStateCallback(const sensor_msgs::JointState::ConstPtr& joint_state_in)
{
  sensor_msgs::JointState in = *joint_state_in;
  if(debug_mode_) printJointStateIn(in);

  for(int i = 0; i < num_joints_; i++) {
    std::string name = joint_names_.at(i);
    double position = 0.0;

    for(int j = 0; j < in.name.size(); j++) {

      if(name.compare(in.name[j]) == 0)  {
	position = in.position[j];
	current_joint_positions_.at(i) = position;
	break;
      }

    }

  }

  timeOfLastJointState_ = ros::Time::now();
}

void GummiTeleop::buttonCallback(const sensor_msgs::Joy::ConstPtr& joy_in)
{
  sensor_msgs::Joy in = *joy_in;
  button1_ = in.buttons[0];
  button2_ = in.buttons[1];

  processButtonPress();
}

geometry_msgs::Twist GummiTeleop::scaleDesired(geometry_msgs::Twist desired) 
{
  geometry_msgs::Twist out;

  out.linear.x = desired.linear.x * 4; // TODO: USE PARAMETERS ABOVE
  out.linear.y = desired.linear.y * 4; // TODO: USE PARAMETERS ABOVE
  out.linear.z = desired.linear.z * 4; // TODO: USE PARAMETERS ABOVE
  
  out.angular.x = desired.angular.x * 15; // TODO: USE PARAMETERS ABOVE
  out.angular.y = desired.angular.y * 15; // TODO: USE PARAMETERS ABOVE
  out.angular.z = desired.angular.z * 15; // TODO: USE PARAMETERS ABOVE

  return out;
}

void GummiTeleop::calculateDesiredJointVelocity(geometry_msgs::Twist desired)
{

  KDL::Twist T_current;
  KDL::JntArray q_current(num_joints_);
  KDL::JntArray qdot(num_joints_);
  double time_step = 0.01; // TODO

  T_current.vel.x(0.0);
  T_current.vel.y(0.0);
  T_current.vel.z(0.0);
  T_current.rot.x(0.0);
  T_current.rot.y(0.0);
  T_current.rot.z(0.0);

  for(int i = 0; i < num_joints_; i++) {
    q_current(i) = current_joint_positions_.at(i);
  }

  KDL::Vector pos_vel(desired.linear.x,
		      desired.linear.y,
		      desired.linear.z);
  KDL::Vector rot_vel(desired.angular.x,
		      desired.angular.y,
		      desired.angular.z);
  KDL::Twist T_desired = KDL::Twist(pos_vel, rot_vel);

  KDL::Frame F_current;
  int ret_fk = fk_solver_->JntToCart(q_current,F_current);
  if(ret_fk < 0) {
    printf("FK not solved!\n");
    assert(false);
  }

  KDL::Frame F_at_hand = F_current;
  F_at_hand.M = KDL::Rotation::Identity();

  T_desired = F_at_hand * T_desired;

  if(!have_started_integrating_) {
    F_integrated_ = F_current;
    have_started_integrating_ = true;
  }
  else {
    KDL::Frame F_step(KDL::Rotation::RPY(T_desired.rot.x() * time_step,
					 T_desired.rot.y() * time_step,
					 T_desired.rot.z() * time_step),
		      KDL::Vector(T_desired.vel.x() * time_step,
				  T_desired.vel.y() * time_step,
				  T_desired.vel.z() * time_step));
    
    // Calculate desired pose
    KDL::Frame F_desired;
    F_desired = F_step*F_integrated_; 
    
    KDL::Twist T_error;
    T_error = diff(F_current, F_desired);
    
    for(unsigned int i=0; i<num_joints_; i++) {
      T_current(i) = T_error(i) * control_gain_;
    }  
    
    F_integrated_ = F_current;
  }

  int ret_ik = ik_solver_->CartToJnt(q_current,T_current, qdot);
  if(ret_ik < 0) {
    printf("Diff IK not solved!\n");
    assert(false);
  }

  double max_current_joint_vel = 0.0;
  for(unsigned int i=0; i<num_joints_; i++) {
    if(std::abs(qdot(i)) > max_joint_vel_) {
      max_current_joint_vel = std::abs(qdot(i));
    }
  }

  if(max_current_joint_vel > max_joint_vel_) {
    printf("Warning: Limiting joint velocities.\n");
    for(unsigned int i=0; i<num_joints_; i++) {
      desired_joint_velocities_.at(i) = limitJointVelocity(qdot(i), max_current_joint_vel); 
    }
  }
  else {
    for(unsigned int i=0; i<num_joints_; i++) {
      desired_joint_velocities_.at(i) = qdot(i);
    }
  }
  
}

void GummiTeleop::publishJointVelocities()
{

  sensor_msgs::JointState message;
  std::vector<double> positions;

  message.name = joint_names_;
  message.effort = joint_stiffnesses_;
  message.velocity = desired_joint_velocities_;

  if(passive_wrist_) {
    message.effort[5] = -999;
  }

  joint_cmd_pub_.publish(message);

}


 void GummiTeleop::processButtonPress() {

  ros::Time now = ros::Time::now();

  if(button1_) {
    ros::Duration diff = now - time_last_button1_;
    double time_passed = diff.toSec();
    if(time_passed > 1.0) {
       if(!equilibrium_control_) {
	 for(int i = 0; i < num_joints_; i++) {
	   joint_stiffnesses_.at(i) = -std::abs(joint_stiffnesses_.at(i));
	 }
	 equilibrium_control_ = true;
	 printf("Switching to equilibrium control.\n");
       }
       else {
	 for(int i = 0; i < num_joints_; i++) {
	   joint_stiffnesses_.at(i) = std::abs(joint_stiffnesses_.at(i));
	 }
	 equilibrium_control_ = false;
	 have_started_integrating_ = false;
	 printf("Switching to position control.\n");
       }
     }
     time_last_button1_ = ros::Time::now();
   }
   else {
     if(button2_) {
       ros::Duration diff = now - time_last_button2_;
       double time_passed = diff.toSec();
       if(time_passed > 1.0) {
	 if(!equilibrium_control_) {
	   if(stiff_arm_) {
	     stiff_arm_ = false;
	     printf("Setting all joint to loose.\n");
	     for(int i = 0; i < num_joints_; i++) {
	       joint_stiffnesses_.at(i) = 0.1;
	     }
	   }
	   else {
	     stiff_arm_ = true;
	     printf("Setting all joint to stiff.\n");
	     for(int i = 0; i < (num_joints_); i++) {
	       joint_stiffnesses_.at(i) = 0.75;
	     }
	   }
	 }
	 else {
	   printf("WARNING: Cannot change stiffness while in equilibrium control.\n");
	 }
       }
       time_last_button2_ = ros::Time::now();
     }
   }

 }


void GummiTeleop::printDesired(geometry_msgs::Twist desired) 
{
  printf("Debug: Got desired linear velocity (x,y,z): %5.2f, %5.2f, %5.2f.\n",desired.linear.x,desired.linear.y,desired.linear.z);
  printf("Debug: Got desired angular velocity (x,y,z): %5.2f, %5.2f, %5.2f.\n",desired.angular.x,desired.angular.y,desired.angular.z);
}

void GummiTeleop::printJointStateIn(sensor_msgs::JointState joint_state_in)
{
  for(int i = 0; i < joint_state_in.name.size(); i++) {
    std::string name = joint_state_in.name[i];
    double position = joint_state_in.position[i];
    printf("Debug: Got current position for joint %s: %5.2f.\n", name.c_str(), position);
  }
}

bool GummiTeleop::checkIfConnectedToRobot()
{

  assert(timeOfLastJointState_.isValid());

  ros::Time joint = timeOfLastJointState_;
  ros::Time now = ros::Time::now();
  ros::Duration difference = now-joint;
  double timePassedMs = difference.toSec()*1000;
  
  if(debug_mode_) printf("Debug: Time since last joint state received: %6.2f ms.\n",timePassedMs);

  if(timePassedMs > 200) {
    return false;
  }
  else {
    return true;
  }

}

bool GummiTeleop::isZero(geometry_msgs::Twist vel) {
  if((vel.linear.x == 0.0) &&
     (vel.linear.y == 0.0) &&
     (vel.linear.z == 0.0) &&
     (vel.angular.x == 0.0) &&
     (vel.angular.y == 0.0) &&
     (vel.angular.z == 0.0)) {

    return true;

  }

  return false;
}

double GummiTeleop::limitJointVelocity(double vel, double max_current_vel) {
  return vel * max_joint_vel_/max_current_vel;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "gummi_teleop");
  GummiTeleop gummi_teleop;

  ros::spin();
}

