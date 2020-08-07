#!/bin/bash -x

randomcheck=$(($RANDOM%2));
if [ $randomcheck -eq 0 ];
then
    echo Heads
else
    echo Tails
fi
