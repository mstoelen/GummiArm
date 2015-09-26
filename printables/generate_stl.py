#!/usr/bin/env python

freecadpath='/Applications/FreeCAD.app/Contents/lib' # point to FreeCAD lib folder
import sys
sys.path.append(freecadpath)

import os
import glob
import FreeCAD
import Mesh

rootdir = '/Users/mstoelen/github/GummiArm/printables' # point to printables folder

for subdir, dirs, files in os.walk(rootdir):
    for filename in glob.glob(os.path.join(subdir, '*.FCStd')):
        document = FreeCAD.openDocument(filename)
        objects = [ document.ActiveObject ]
        outname = filename[:-5] + "stl"
        Mesh.export(objects, outname)
        FreeCAD.closeDocument(document.Name)
