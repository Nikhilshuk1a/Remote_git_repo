#!/bin/bash

#Declaring of a Variable in conversation file

person1=$1
person2=$2

echo "$person1:Hi $person2,Nice to see You."
echo "$person2: Hello $person1, How are you ?"
echo "$person1: I am fine wbu $person2 it's been a long time"
echo "$person2: I am good, I was out of country for some work, where do you work $person1?"

no=$3

echo "$person1:leave it, Guess a Number from 1-10"

#Indention attention required please leave a space
if [ $no -ge 10 ]
then
	echo "$no is greater than 10"
else
	echo "$no is less than 10"
fi

#Shell script using if else conditon 


