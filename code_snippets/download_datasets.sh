#!/bin/bash

# download datasets from google driver

fileid = "1YXo8M51jycZeNhgVGZEeTQigopPnz2pi"   # modify fileid
filename = "lfw.tar.gz" # modify filename
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf ./cookie
