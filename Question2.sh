#Question2
#!/bin/bash
# This script backs up all the files in the repository, except if the file has previously been backed up, and pushes the backup to the github repository
# cron job command is used to ensure the script runs everyday at 1:00am crontab -e 01*** 

#Input path to repository folder, github URL, github username and password as parameters
path=$1
url=$2
username=$3
password=$4

#The script compresses all files except if the file has been previously backed up
# tar c:create, z:compress using gzip, v:verbose, f: into file

# Naming backup files where the file name is backup, followed by the current year, month, day and hour
year=$(date +'%Y')
month=$(date +'%m')
day=$(date +'%d')
hour=$(date +'%H')

#Compress files
tar -C $path -czvf backup$year$month$day$hour.tgz --exclude= *.tgz &> backupsLog #previously backed up files with current date

#Commit the new backup file to local git repository
git add backup$yeah$month$day$hour.tgz
git commit -m "Commiting the backup file to the git repository"

#Push the new backup file to remote git repository
git push http://$3:$4@$2 --all 

#Run the script everyday at 1:00AM and its output redirected to the backupsLog file
echo The file has been backed up to the backupLog file

