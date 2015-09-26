#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/JointState.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/Float64.h>

#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

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
  void calculateDesiredJointPosition(geometry_msgs::Twist desired);
  void publishJointPositions();
  void printDesired(geometry_msgs::Twist desired);
  void printJointStateIn(sensor_msgs::JointState joint_state_in);
  bool checkIfConnectedToRobot();
  void updateInternalJointState();
  void processButtonPress();

  ros::NodeHandle nh_;

  int linear_, angular_, num_joints_, debug_mode_;
  double l_scale_, a_scale_;
  ros::Publisher joint_cmd_pub_;
  ros::Publisher gripper_pub_;
  ros::Subscriber desired_sub_, joint_state_sub_, button_sub_;
  std::vector<std::string> joint_names_;
  std::vector<double> current_joint_positions_;
  bool receivedJointPositions_;
  bool button1_, button2_;
  std::vector<double> joint_stiffnesses_;

  moveit::core::RobotModelPtr kinematic_model_;
  moveit::core::RobotStatePtr kinematic_state_;
  const moveit::core::JointModelGroup* joint_model_group_;
  ros::Time timeOfLastJointState_;
  bool passive_wrist_;
  
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
  receivedJointPositions_ = false;
  button1_ = 0;
  button2_ = 0;
  passive_wrist_ = false;

  robot_model_loader::RobotModelLoader robot_model_loader("robot_description"); 
  kinematic_model_ = robot_model_loader.getModel();
  ROS_INFO("Model frame: %s", kinematic_model_->getModelFrame().c_str());  

  moveit::core::RobotStatePtr kinematic_state(new robot_state::RobotState(kinematic_model_));
  kinematic_state_ = kinematic_state;
  kinematic_state_->setToDefaultValues(); 
  joint_model_group_ = kinematic_model_->getJointModelGroup("right");

  const std::vector<std::string>&  j_n = kinematic_model_->getJointModelNames(); 
  joint_names_.assign(j_n.begin() + 1,j_n.end() - 2); //TODO
  assert(joint_names_.size() == num_joints_);

  for(int i = 0; i < num_joints_; i++) {
    joint_stiffnesses_.push_back(0.75);
  }

  for(int i = 0; i < num_joints_; i++) {
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

    if(!receivedJointPositions_) {

      ros::Duration(2.0).sleep();

      updateInternalJointState();
      printf("Received initial pose OK, starting robot control!\n");
      receivedJointPositions_ = true;

    }
    else {
      
      calculateDesiredJointPosition(vel);
      publishJointPositions();

    }
    
  }
  else {
    printf("Warning: not connected to robot, not sending command.\n");
    receivedJointPositions_ = false;
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

  out.linear.x = desired.linear.x * 0.04; // TODO: USE PARAMETERS ABOVE
  out.linear.y = desired.linear.y * 0.04; // TODO: USE PARAMETERS ABOVE
  out.linear.z = desired.linear.z * 0.04; // TODO: USE PARAMETERS ABOVE
  
  out.angular.x = desired.angular.x * 0.07; // TODO: USE PARAMETERS ABOVE
  out.angular.y = desired.angular.y * 0.07; // TODO: USE PARAMETERS ABOVE
  out.angular.z = desired.angular.z * 0.07; // TODO: USE PARAMETERS ABOVE

  return out;
}

void GummiTeleop::calculateDesiredJointPosition(geometry_msgs::Twist desired)
{

  if(kinematic_state_->setFromDiffIK(joint_model_group_, desired, "tool", 0.05)) {
   
  }
  else {
    printf("Diff IK not solved!\n"); // TODO: A BETTER SOLUTION?
    assert(false);
  }
  
}

void GummiTeleop::publishJointPositions()
{

  sensor_msgs::JointState message;
  std::vector<double> positions;
  for(int i = 0; i < num_joints_; i++) {
    positions.push_back(kinematic_state_->getVariablePosition(joint_names_.at(i)));
  }

  message.name = joint_names_;
  message.effort = joint_stiffnesses_;
  message.position = positions;

  if(passive_wrist_) {
    message.effort[5] = -message.effort[5];
  }

  joint_cmd_pub_.publish(message);
}


 void GummiTeleop::processButtonPress() {

   std_msgs::Float64 message;
   if(button1_) {
     passive_wrist_ = true;
     printf("Switching to passive wrist.\n");
     joint_stiffnesses_.at(5) = 0.25;
   }
   else {
     if(button2_) {
       passive_wrist_ = false;
       printf("Switching to active wrist.\n");
       joint_stiffnesses_.at(5) = 0.75;
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

void GummiTeleop::updateInternalJointState()
{
  for(int i = 0; i < num_joints_; i++) {
    std::string name = joint_names_.at(i);
    double position = current_joint_positions_.at(i);
    kinematic_state_->setVariablePosition(name, position);
  }
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "gummi_teleop");
  GummiTeleop gummi_teleop;

  ros::spin();
}
