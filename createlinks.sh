#!/usr/bin/env bash
#
# Creates symlinks in /tmp/final for all frames of the video,
# looped some number of times.
#

for f in render/combined*.png; do
    ln -s $PWD/$f /tmp/final/`printf "%04g" $i`.png
    i=$(( i + 1 ))
done
