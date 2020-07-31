#!/bin/bash -x

head=0
tails=0

while [[ $head -lt 21 && $tails -lt 21 ]]
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

if [ $head -gt $tails ]
then
    echo "Heads win"
elif [ $tails -gt $head ]
then
    echo "Tails wins"
else
    echo "tie"
fi
