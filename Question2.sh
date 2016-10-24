Question2
#!/bin/bash
# This script backs up all the files in the repository, except if the file has previously been backed up, and pushes the backup to the github repository
# cron job command is used to ensure the script runs everyday at 1:00AM

#Input path to repository folder, github URL, github username and password
echo "Please enter the path to the repository folder: "
read input_variable
echo "The path to the repository folder is: $input_variable"
echo "Please enter the github URL: "
read input_variable2
echo "The github URL is: $input_variable2"
echo "Please enter your github username: "
read username;
echo "Please enter your github password: "
$ read -s password; #to hide password


