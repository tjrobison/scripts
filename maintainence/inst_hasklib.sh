#! /bin/bash

ghc Setup.hs && echo "Setup linked!"
./Setup configure && echo "Setup configured!"
./Setup build && echo "Library built!"
sudo ./Setup install && echo "Install was successful"
cd ..
