#!/bin/bash

# download datasets from google driver
#
fileid = "1f0Yu5GG_MTTmGQaH4Z5900Dt5EM_VJEa"   # modify fileid
filename = "wordpress_170605.zip" # modify filename
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm -rf ./cookie
