#!/bin/bash -x

read -p "Enter a value:" a
read -p "Enter b value:" b
read -p "Enter c value:" c

echo $a $b $c | awk '{print $1+$2*$3}'
echo $a $b $c | awk '{print $1*$2+$3}'
echo $a $b $c | awk '{print $3+$1/$2}'
