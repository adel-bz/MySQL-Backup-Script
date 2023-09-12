# !/bin/bash

### Reading ENV ###
source $(dirname $BASH_SOURCE)/.env

### Database Backup ###
printf ""$GREEN"......... BACKUP STARTED ......... "$NC" \t "$date" \t Done\n"
sudo docker exec "$db_container_name" /usr/bin/mysqldump -u "$db_username" --password="$db_pass" "$db_name" > "$db_dest" &&

### Assets Backup ###
sudo docker cp "$backend_container_name":"$assets_volume_location" "$assets_dest"
if [ $? == 0 ]
then
  printf ""$GREEN"####### Backup has been done"$NC""
  sleep 2
else
  printf ""$RED"####### Backup was Unsuccessful"
  curl -H "Content-Type: application/json" -X POST -d '{"content":"Backup was Unsuccessful....Please check backup logs on server. '$date'"}' "$discord_url"
  exit
fi

### Compress files ###
printf ""$GREEN"####### Compress "$NC""
sudo tar -czvf "$backup_dest""$date".tar.gz --absolute-names "$backup_dest"
echo ".........."

### Uploading Backups to Backup Server && Sending Alert to Discord && Removing Older Backup than 1 month ###
sudo curl -T "$backup_dest""$date".tar.gz  ftp://"$backup_host""$backup_host_dir" --user "$backup_host_user":"$backup_host_pass"
if [ $? == 0 ]
then
  printf ""$GREEN"####### Upload was Successful"$NC""
  curl -H "Content-Type: application/json" -X POST -d '{"content":"Successful '$date'" }' "$discord_url"
  echo ".........."
  curl -v -u "$backup_host_user":"$backup_host_pass" ftp://"$backup_host" -Q "DELE $backup_host_dir$rmdate.tar.gz"

else
  printf ""$RED"####### Upload was Unsuccessful"
  curl -H "Content-Type: application/json" -X POST -d '{"content":"Unsuccessful '$date'"}' "$discord_url"
  echo ".........."
fi

### Clean
sudo rm -rf /srv/backup/*
echo ".........."
printf ""$GREEN"####### Cleaned "$NC" \t "$date" \t Done\n"
printf ""$GREEN"......... BACKUP FINISHED ......... "$NC" \t "$date" \t Done\n"
