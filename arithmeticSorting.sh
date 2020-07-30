#!/bin/bash -x

read -p "Enter a value:" a
read -p "Enter b value:" b
read -p "Enter c value:" c

declare -A computation
computation[a+b*c]=$(($a+$b*$c))
computation[a*b+c]=$(($a*$b+$c))
computation[c+a/b]=$(($c+$a/$b))
computation[a%b+c]=$(($a%$b+$c))

counter=0
for value in ${computation[@]}
do
  valuesarray[((count++))]=$value
done

for ((i=0;i<${#valuesarray[@]};i++))
do
  for ((j=0;j<${#valuesarray[@]}-$i-1;j++))
  do
    if [ ${valuesarray[$j]} -lt ${valuesarray[$j+1]} ]
    then
        temp=${valuesarray[$j]}
        valuesarray[$j]=${valuesarray[$j+1]}
        valuesarray[$j+1]=$temp
    fi
  done
done

echo "computation results in decending order "${valuesarray[@]}
