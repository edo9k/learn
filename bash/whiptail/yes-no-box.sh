
if (whiptail --title "Yes or No Dialog" --yesno "Some yes-no question." 8 78)
then
  echo "User selected Yes, exit status -> $?."
else 
  echo "User selected No, exit status -> $?."
fi

