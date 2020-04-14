#!/bin/bash -x

check=$((1+RANDOM%2))
Heads=1
Tails=2

HHc=0
THc=0
TTc=0
HTc=0

declare -A dict
for(( i=0; i<5 ; i++ ))
do
  if [ $check -eq $Heads -a $check -eq $Heads ]
  then
     Heads Heads
     ((HHc++))
  elif [ $check -eq $Tails -a $check -eq $Tails ]
  then
     Tails Tails
     ((TTc++))
  elif [ $check -eq $Tails -a $check -eq $Heads ]
  then
     Tails Heads
      ((THc++))
  elif [ $check -eq $Heads -a $check -eq $Tails ]
  then
     Heads Tails
       ((HTc++))
  else
    coin is stable
  fi
done

dict[Heads Heads]=$HHc
dict[Tails Tails]=$TTc
dict[Heads Tails]=$HTc
dict[Tails Heads]=$THc

echo percentage of heads heads is $(( ($HHc/5) * 100 ))
echo percentage of heads tails is $(( ($HTc/5) * 100 ))
echo percentage of tails heads is $(( ($THc/5) * 100 ))
echo percentage of tails tails is $(( ($TTc/5) * 100 ))

