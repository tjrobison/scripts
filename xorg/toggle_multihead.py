#!/usr/bin/python2

import os, sys, sh

if __name__ == '__main__':
    if not os.access('/etc/X11', 2):
        print 'Please rerun this script with root privleges.'
        sys.exit(1)
    else:
        if os.path.isdir('/etc/X11/xorg.conf.triple/'):
            os.rename('/etc/X11/xorg.conf.d', '/etc/X11/xorg.conf.single')
            os.rename('/etc/X11/xorg.conf.triple', '/etc/X11/xorg.conf.d')
            print "Server layout swapped. X11 will start in triple-head on next run."
        elif os.path.isdir('/etc/X11/xorg.conf.single/'):
            os.rename('/etc/X11/xorg.conf.d', '/etc/X11/xorg.conf.triple')
            os.rename('/etc/X11/xorg.conf.single', '/etc/X11/xorg.conf.d')
            print "Server layout swapped. X11 will start in single-head on next run."
        else:
            print "Couldn't find applicable X11 config directories, is this the right system?"
            sys.exit(1)

    if sys.argv[1] == '-x':
        sh.startx()
