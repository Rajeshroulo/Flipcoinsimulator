#!/bin/bash -x

check=$((1+RANDOM%2))
Heads=1
Tails=2
Hc=0
Tc=0
declare -A dict

for(( i=0; i<5 ; i++ ))
do
  if [ $check -eq $Heads ]
  then
     Heads
     ((Hc++))
  elif [ $check -eq $Tails ]
  then
     Tails
     ((Tc++))
  else
    coin is stable
  fi
done

dict[heads]=$Hc
dict[tails]=$Tc

echo percentage of heads is $(( ($Hc/5) * 100 ))
echo percentage of tails is $(( ($Tc/5) * 100 ))
