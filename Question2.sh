Question2
#!/bin/bash
# This script backs up all the files in the repository, except if the file has previously been backed up, and pushes the backup to the github repository
# cron job command is used to ensure the script runs everyday at 1:00AM

#Still needed: clarify if userInput or parameters is better to use to get user info.
#Best way to tell bash not to backup currently backed up files (exclued current date?)
#Clarify that zip files correct format

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

#The script compresses all files except if the file has been previously backed up
# tar c:create, z:compress using gzip, v:verbose, f: into file

# Naming backup files where the file name is backup, followed by the current year, month, day and hour
TIME=$(date + %Y%M%D-%H)

#The filename will be "backup" and the year/month/day/hour that the file was backed up
fileName=backup -$TIME.tar.gz

#Path to repository
locationOfFile= "/https://github.com/dseekatz/CISC220_2.git"

#Destination of backup
mkdir compressedFiles =/backupfolder 

#help with how this works: tar czvf pathtoCompressedFile /pathToCompress. What about filename?
tar czvf compressedFiles.tgz fileName /locationOfFile --exclude= <date +%Y-%m-%d-%H) #previously backed up files with current date?
  
#Commit the new backup file to local git repository
git commit compressedFiles.tgz

#Push the new backup file to remote git repository
git push https://github.com/dseekatz/CISC220_2.git --all

#Run the script everyday at 1:00AM and its output redirected to the backupsLog file
#Create backupLog file
$ cat > backupLog.sh

#Create run time: daily at 1:00am
crontab -e 001*** echo >> backupLog.sh

