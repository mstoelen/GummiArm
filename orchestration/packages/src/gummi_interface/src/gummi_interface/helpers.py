#!/usr/bin/env python

def radToDeg(angles):
    pi = 3.1416
    for i,a in enumerate(angles):
        a = a * 180/pi
        angles[i] = a
    return angles
