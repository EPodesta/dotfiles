#!/bin/bash
 
# Dependencies:
# imagemagick
# i3lock-color-git
# scrot
 
IMAGE=/tmp/i3lock.png
 
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x3" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s
BLURTYPE="4x8"

scrot $IMAGE
convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE $IMAGE
i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=00000055 -i $IMAGE
rm $IMAGE

