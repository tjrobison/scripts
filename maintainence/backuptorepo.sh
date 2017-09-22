#!/bin/bash

rsync -a /home/tj/scripts/* /home/tj/src/thosefreshrepos/scripts

rsync -a --delete /etc/* /home/tj/src/thosefreshrepos/etc.clyde
rsync -a --delete tj@blinky:/etc/* /home/tj/src/thosefreshrepos/etc.blinky
