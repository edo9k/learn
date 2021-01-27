
whiptail --title "Menu Example" \
  --menu "Choose an option" 25 78 16 \
  "Back"          "Return to the previous menu."            \
  "Add user"      "Add user to the system."                 \
  "Modify user"   "Modify an existing user."                \
  "List users"    "List all users on the system."           \
  "Add group"     "Add a user group to the system."         \
  "Modify group"  "Modify a group and its list of members." \
  "List groups"   "List all groups on the system."

echo -e "\n--"
