#!/usr/bin/env python

# Description: Enters all subfolders in 'rootdir', opens all .FCStd files found, and exports the latest object created in each file as .stl
# Usage: Run as macro script from FreeCAD (e.g. from 'Macro' menu).
# Note: Tested on Mac OSX Yosemite only.

import os
import glob
import FreeCAD
import Mesh

rootdir = '/Users/mstoelen/Git/GummiArm/printables' # point to printables folder

for subdir, dirs, files in os.walk(rootdir):
    for filename in glob.glob(os.path.join(subdir, '*.FCStd')):
        document = FreeCAD.openDocument(filename)
        objects = [ document.ActiveObject ]
        outname = filename[:-5] + "stl"
        Mesh.export(objects, outname)
        FreeCAD.closeDocument(document.Name)
