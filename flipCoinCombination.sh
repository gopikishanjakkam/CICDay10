#!/bin/bash -x

n=15
declare -A singlet
singlet[H]=0
singlet[T]=0

for((i=1;i<=$n;i++))
do
  randomcheck=$(($RANDOM%2));
  if [ $randomcheck -eq 0 ];
  then
      echo Heads
      singlet[H]=$((${singlet[H]}+1));
  else
      echo Tails
      singlet[T]=$((${singlet[T]}+1));
  fi
done

echo "percentage of H="$((${singlet[H]}*100/$n))
echo "percentage of T="$((${singlet[T]}*100/$n))
