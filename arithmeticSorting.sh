#!/bin/bash -x

read -p "Enter a value:" a
read -p "Enter b value:" b
read -p "Enter c value:" c

declare -A computation
computation[a+b*c]=$(echo $a $b $c | awk '{print $1+$2*$3}')
computation[a*b+c]=$(echo $a $b $c | awk '{print $1*$2+$3}')
computation[c+a/b]=$(echo $a $b $c | awk '{print $3+$1/$2}')
computation[a%b+c]=$(echo $a $b $c | awk '{print $1%$2+$3}')

counter=0
for value in ${computation[@]}
do
  valuesarray[((count++))]=$value
done

echo ${valuesarray[@]}
