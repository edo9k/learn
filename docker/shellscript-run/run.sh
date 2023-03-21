#!/bin/bash 

echo " --- ksh --- "
ksh -c "$1"  
echo -e "exit: $? \n\n" 

echo " --- zsh --- "
zsh -c "$1" 
echo -e "exit: $? \n\n" 

echo " --- csh --- "
csh -c "$1"
echo -e "exit: $? \n\n"

echo " --- posh --- "
posh -c "$1" 
echo -e "exit: $? \n\n"

echo " --- fish --- "
fish -c "$1" 
echo -e "exit: $? \n\n"

echo " --- bash --- "
bash -c "$1" 
echo -e "exit: $? \n\n"

echo " --- dash --- "
dash -c "$1" 
echo -e "exit: $? \n\n" 
