#!/usr/bin/bash

if [ "x$1" == "x" ]; then
    echo "No file name specified for script."
    exit 1

else
    FILENAME="$1.py" &&
    cp /home/tj/code/templates/py2-script-template.py $FILENAME &&
    chmod +x $FILENAME &&
    vim $FILENAME
fi
