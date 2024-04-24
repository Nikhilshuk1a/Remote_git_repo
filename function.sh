#!/bin/bash
#This is a comment

# defining a variable
echo "What is the name of the directory you want to create?"
# reading input 
read NAME

echo "Creating $NAME ..."
mkcd ()
{
  mkdir $NAME 
  cd $NAME
}

mkcd
echo "You are now in $NAME"
