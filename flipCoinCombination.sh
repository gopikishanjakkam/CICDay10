#!/bin/bash -x

n=15
declare -A singlet
singlet[H]=0
singlet[T]=0

declare -A Doublet
Doublet[HH]=0
Doublet[HT]=0
Doublet[TH]=0
Doublet[TT]=0

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

for((i=1;i<=$n;i++))
do
  a=$(($RANDOM%2));
  b=$(($RANDOM%2));
  if [[ $a -eq 0 && $b -eq 0 ]];
  then
      Doublet[HH]=$((${Doublet[HH]}+1));
  elif [[ $a -eq 0 && $b -eq 1 ]];
  then
      Doublet[HT]=$((${Doublet[HT]}+1));
  elif [[ $a -eq 1 && $b -eq 0 ]];
  then
      Doublet[TH]=$((${Doublet[TH]}+1));
  elif [[ $a -eq 1 && $b -eq 1 ]];
  then
      Doublet[TT]=$((${Doublet[TT]}+1));
  fi
done

echo "percentage of H="$((${singlet[H]}*100/$n))
echo "percentage of T="$((${singlet[T]}*100/$n))

echo "percentage of HH="$((${Doublet[HH]}*100/$n))
echo "percentage of HT="$((${Doublet[HT]}*100/$n))
echo "percentage of TH="$((${Doublet[TH]}*100/$n))
echo "percentage of TT="$((${Doublet[TT]}*100/$n))
