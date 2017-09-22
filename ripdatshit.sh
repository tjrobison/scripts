#!/bin/bash

echo "MP3 VBR quality setting: [0-9]"
read $q

mkdir $HOME/tmp/rip
cd $HOME/tmp/rip
cdparanoia -B

for i in *.wav; do
    lame -V $q $i mp3/${i%.*.*}.mp3
done

echo "Tag mp3 files with Easytag? [y/n]"
read $yn

if [[ "$yn" == "y" ]]; then
    easytag $HOME/tmp/rip
fi
