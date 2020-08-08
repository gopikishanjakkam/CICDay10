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

declare -A Triplet
Triplet[HHH]=0
Triplet[HHT]=0
Triplet[HTH]=0
Triplet[THH]=0
Triplet[HTT]=0
Triplet[THT]=0
Triplet[TTH]=0
Triplet[TTT]=0

for((i=1;i<=$n;i++))
do
  randomcheck=$(($RANDOM%2));
  if [ $randomcheck -eq 0 ];
  then
      singlet[H]=$((${singlet[H]}+1));
  else
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

for((i=1;i<=$n;i++))
do
  a=$(($RANDOM%2));
  b=$(($RANDOM%2));
  c=$(($RANDOM%2));
  if [[ $a -eq 0 && $b -eq 0 && $c -eq 0 ]];
  then
      Triplet[HHH]=$((${Triplet[HHH]}+1));
  elif [[ $a -eq 0 && $b -eq 0 && $c -eq 1 ]];
  then
      Triplet[HHT]=$((${Triplet[HHT]}+1));
  elif [[ $a -eq 0 && $b -eq 1 && $c -eq 0 ]];
  then
      Triplet[HTH]=$((${Triplet[HTH]}+1));
  elif [[ $a -eq 1 && $b -eq 0 && $c -eq 0 ]];
  then
      Triplet[THH]=$((${Triplet[THH]}+1));
  elif [[ $a -eq 0 && $b -eq 1 && $c -eq 1 ]];
  then
      Triplet[HTT]=$((${Triplet[HTT]}+1));
  elif [[ $a -eq 1 && $b -eq 0 && $c -eq 1 ]];
  then
      Triplet[THT]=$((${Triplet[THT]}+1));
  elif [[ $a -eq 1 && $b -eq 1 && $c -eq 0 ]];
  then
      Triplet[TTH]=$((${Triplet[TTH]}+1));
  elif [[ $a -eq 1 && $b -eq 1 && $c -eq 1 ]];
  then
      Triplet[TTT]=$((${Triplet[TTT]}+1));
  fi
done

echo "percentage of H="$(echo ${singlet[H]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of T="$(echo ${singlet[T]} 100 $n | awk '{print $1*$2/$3}')

echo "percentage of HH="$(echo ${Doublet[HH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of HT="$(echo ${Doublet[HT]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of TH="$(echo ${Doublet[TH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of TT="$(echo ${Doublet[TT]} 100 $n | awk '{print $1*$2/$3}')

echo "percentage of HHH="$(echo ${Triplet[HHH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of HHT="$(echo ${Triplet[HHT]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of HTH="$(echo ${Triplet[HTH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of THH="$(echo ${Triplet[THH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of HTT="$(echo ${Triplet[HTT]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of THT="$(echo ${Triplet[THT]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of TTH="$(echo ${Triplet[TTH]} 100 $n | awk '{print $1*$2/$3}')
echo "percentage of TTT="$(echo ${Triplet[TTT]} 100 $n | awk '{print $1*$2/$3}')

x=0
for index in ${!singlet[@]}
do
  if [ ${singlet[$index]} -gt $x ]
  then
      x=${singlet[$index]}
      Smax=$index
  fi
done

echo "maximum winning combination in singlet is "$Smax" with "$(echo ${singlet[$Smax]} 100 $n | awk '{print $1*$2/$3}')"%"

y=0
for index in ${!Doublet[@]}
do
  if [ ${Doublet[$index]} -gt $y ]
  then
      y=${Doublet[$index]}
      Dmax=$index
  fi
done

echo "maximum winning combination in Doublet is "$Dmax" with "$(echo ${Doublet[$Dmax]} 100 $n | awk '{print $1*$2/$3}')"%"

z=0
for index in ${!Triplet[@]}
do
  if [ ${Triplet[$index]} -gt $z ]
  then
      z=${Triplet[$index]}
      Tmax=$index
  fi
done

echo "maximum winning combination in Triplet is "$Tmax" with "$(echo ${Triplet[$Tmax]} 100 $n | awk '{print $1*$2/$3}')"%"
