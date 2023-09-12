# MySQL-Bcakup-Script

# Table of Contents
- [Introduction](https://github.com/adel-bz/MSSQL-Config#introduction)
- [Features](https://github.com/adel-bz/MySQL-Backup-Script#features)
- [Prerequisites](https://github.com/adel-bz/MySQL-Backup-Script#prerequisites)
- [Installation](https://github.com/adel-bz/MySQL-Backup-Script#installation)
- [Usage](https://github.com/adel-bz/MySQL-Backup-Script#usage)
- Environments
- [Contributing](https://github.com/adel-bz/MySQL-Backup-Script#contributing)

# Introduction
The MySQL Backup Script is a versatile and efficient tool for automating MySQL database backups. It simplifies the process of creating regular backups, ensuring the safety and integrity of your valuable data. Whether you're a small business owner, a developer, or a system administrator, this script can help you automate your backup procedures with ease.

![Screenshot from 2023-09-09 10-51-44](https://github.com/adel-bz/MySQL-Backup-Script/assets/45201934/41bdac69-2d01-4f76-b212-d07795474684)

# Features
- Automated MySQL database backups.
- Configurable backup schedules.
- Backup compression to save storage space.
- Support for local and remote backup destinations.
- Alert notifications for backup status.
- Highly customizable through environment variables.
- Open-source and easily extendable.

# Prerequisites
Before using the MySQL Backup Script, ensure you have the following prerequisites:

- A Linux-based operating system (e.g., Ubuntu, CentOS).
- Bash shell (usually pre-installed on Linux systems).
- MySQL or MariaDB installed and configured.
- FTP server (Backup server) for remote backups.

# Installation
To install and configure the MySQL Backup Script, follow these steps:

1. Clone the repository to your server:

```
git clone https://github.com/adel-bz/MySQL-Backup-Script.git
```
2. Navigate to the script directory:

```
cd MySQL-Backup-Script
```
3. Review and edit the .env file to configure your backup settings, including database credentials, backup location, schedule, and notification preferences.

4. Make the script executable:
   
```
chmod +x backup.sh
```
5. Schedule regular backups using cron jobs. For example, to run daily backups at midnight, add the following line to your crontab:

```
0 0 * * * /path/to/MySQL-Backup-Script/backup.sh
```

# Usage
Once configured, the MySQL Backup Script will run automatically according to your specified schedule. You can also run manual backups by executing:

```
./backup.sh
```

# Environment

### Database ENV

```db_container_name:``` Your Mysql container name, like ```db_container```.

```db_dest:``` Your database backup will move to this location on the host, ```/dir/backup/backup.sql``` with this name ```backup.sql```.

```db_name:``` Your database name on Mysql, for instance ```test```.

```db_username:``` Mysql username, As an example ```adel```, ```root``` is a default username for MySQL.

```db_pass:``` Mysql password, As an example ```database_pass```.


### Assests ENV

```backend_container_name:``` Your backend container name, for example ```back_container```.

```assets_volume_location:``` This is your assets files location on the container.

```assets_dest:```Your assets backup will move to this location on the host.


### Backup Host ENV

```backup_host:``` Your backup server URL or IP.

```backup_host_user:``` Your Backup server username.

```backup_host_pass:``` Your Backup server password.

```backup_host_dir:``` Your backup location on the backup server, example ```/backup/test/```

```backup_dest:``` Your backup directory location on the host. this env will be used for compressing backup.


### Other ENV

```date:``` For get the date and set on Backup files.

```GREEN, RED, NC:``` Colors.

```slack_url:``` Slack webhook for sending an alert to Slack.

```discord_url:``` Discord webhook for sending an alert to Discord.

> **Note**
> 
> You can use both of them or only one of them webhook to send alerts.


# Contributing
We welcome contributions from the community to improve the MySQL Backup Script. To contribute:

1. Fork the repository.

2. Create a new branch for your feature/fix:
```
git checkout -b feature-name
```
3. Commit your changes and push to your forked repository:
```
git commit -m "Add a descriptive commit message"
git push origin feature-name
```
4. Create a pull request. Your changes will be reviewed, and once approved, they will be merged into the main branch.

Please ensure your code adheres to the project's coding standards.
