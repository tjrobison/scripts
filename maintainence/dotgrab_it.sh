#!/bin/zsh
#
# Downloads a raw textual dotfile from dotshare.it
# First argument is the index of the share
# Second arg is the written name

#if [ "x$1" == "x" ];then
#    echo "No arguments supplied. Usage:"
#    echo "dotgrab_it [index num] [saved name or prefix] [file count]"

if [ -z $3 ];then
    wget http://dotshare.it/dots/$1/0/raw && mv raw "$2"

else
    mkdir "$3" && cd "$3"
    for file in $3; do
        wget http://dotshare.it/dots/$1/$3/raw && mv raw "$3$2"
    done
fi
