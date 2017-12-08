#!/usr/bin/env python

import sys, os

source = sys.argv[1]
source_data = open(source).readlines()
dest_data = []

for line in source_data:
	if line[0] is in range(0,10):
		dest.append(line)

f = open(source + "_stripped.txt", "w")
f.writelines(dest_data)
f.close()

