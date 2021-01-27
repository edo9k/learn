COLOR=$(whiptail --inputbox "What is your favorite color?" 8 38 Blue \
  --title "Color Dialog" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]
then
  echo "User selected Ok and entered " $COLOR
else
  echo "User selected Cancel."
fi

echo "Exit status -> $exitstatus"

