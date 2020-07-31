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

if [ $head -eq $tails ]
then
    while [[ $(($head-$tails)) -lt 2 && $(($tails-$head)) -lt 2 ]]
    do
      randomcheck=$(($RANDOM%2))
      if [ $randomcheck -eq 0 ]
      then
          ((head++))
          echo
      else
          echo Tails
          ((tails++))
      fi
    done
fi

echo "Heads occured $head times"
echo "Tails occured $tails times"

if [ $head -gt $tails ]
then
    echo "Heads win"
elif [ $tails -gt $head ]
then
    echo "Tails wins"
fi
