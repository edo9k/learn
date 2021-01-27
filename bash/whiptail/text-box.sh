
# creates text that will be displayed with --textbox
echo "Bash version: $BASH_VERSION" > textbox_dummy_text
echo "Created at $(date)"         >> textbox_dummy_text
cat /etc/lsb-release              >> textbox_dummy_text

# display dummy text
whiptail --textbox textbox_dummy_text 12 80

