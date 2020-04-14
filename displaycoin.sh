#!/bin/bash -x

check=$((1+RANDOM%2))
Heads=1
Tails=2
if [ $check -eq $Heads ]
then
    echo Heads
elif [ $check -eq $Tails ]
then
    echo Tails
else
    echo coin is stable
fi
