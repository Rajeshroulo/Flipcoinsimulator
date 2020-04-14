#!/bin/bash -x

check=$((1+RANDOM%2))
check1=$((1+RANDOM%2))
check2=$((1+RANDOM%2))

Heads=1
Tails=2
HHHc=0
HTHc=0
TTTc=0
THTc=0
HHTc=0
TTHc=0
THHc=0
HTTc=0

declare -A dict
for(( i=0; i<5 ; i++ ))
do
  if [ $check -eq $Heads -a $check1 -eq $Heads -a $check2 -eq $Heads ]
  then
     Heads Heads Heads
     ((HHHc++))
  elif [ $check -eq $Tails -a $check1 -eq $Tails -a $check2 -eq $Tails ]
  then
     Tails Tails Tails
     ((TTTc++))
  elif [ $check -eq $Tails -a $check1 -eq $Heads -a $check2 -eq $Tails ]
  then
     Tails Heads Tails
      ((THTc++))
  elif [ $check -eq $Heads -a $check1 -eq $Tails -a $check2 -eq $Tails ]
  then
     Heads Tails Tails
       ((HTTc++))
  elif [ $check -eq $Heads -a $check1 -eq $Tails -a $check2 -eq $Heads ]
  then
     Heads Tails Heads
      ((HTHc++))
  elif [ $check1 -eq $Heads -a $check -eq $Tails -a $check2 -eq $Heads ]
  then
     Heads Tails Tails
       ((THHc++))
  elif [ $check -eq $Tails -a $check2 -eq $Heads -a $check1 -eq $Tails ]
  then
     Tails Tails Heads
      ((TTHc++))
  elif [ $check -eq $Heads -a $check1 -eq $Heads -a $check2 -eq $Tails ]
  then
     Heads Tails Tails
       ((HTTc++))
  else
    coin is stable
  fi
done

dict[Heads Heads Heads]=$HHHc
dict[Tails Tails Tails]=$TTTc
dict[Heads Tails Heads]=$HTHc
dict[Tails Heads Tails]=$THTc
dict[Heads Heads Tails]=$HHTc
dict[Tails Tails Heads]=$TTHc
dict[Heads Tails Tails]=$HTTc
dict[Tails Heads Heads]=$THHc

echo percentage of heads heads heads is $(( ($HHHc/5) * 100 ))
echo percentage of heads tails heads is $(( ($HTHc/5) * 100 ))
echo percentage of tails heads tails is $(( ($THTc/5) * 100 ))
echo percentage of tails tails tails is $(( ($TTTc/5) * 100 ))

echo percentage of heads heads tails is $(( ($HHTc/5) * 100 ))
echo percentage of heads tails tails is $(( ($HTTc/5) * 100 ))
echo percentage of tails heads heads is $(( ($THHc/5) * 100 ))
echo percentage of tails tails heads is $(( ($TTHc/5) * 100 ))

