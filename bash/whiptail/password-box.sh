
PASSWORD=$(whiptail --passwordbox "please enter yout secret phrase" 8 78 \
  --title "Password Dialog" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]
then
  echo "User selected Ok and entered " $PASSWORD
else
  echo "User selected Cancel."
fi

echo "Exit status -> $exitstatus"

