#!/usr/bin/env python

import rospy
import sys
import csv

class Recording:

    def __init__(self):
        self.fileName = "out.csv"

    def prepare(self, fileName, header):
        self.fileName = fileName
        self.csvfile = open(self.fileName, 'wb') # TODO
        self.writer = csv.writer(self.csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        self.writer.writerow(header)

    def add(self, line):
        self.writer.writerow(line)
