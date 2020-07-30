#!/bin/bash -x

head=0
tails=0

for((i=0;i<10;i++))
do
  randomcheck=$(($RANDOM%2))
  if [ $randomcheck -eq 0 ]
  then
      echo Heads
      ((head++))
  else
      echo Tails
      ((tails++))
  fi
done

echo "Heads occured $head times"
echo "Tails occured $tails times"
