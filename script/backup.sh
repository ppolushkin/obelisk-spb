#!/bin/sh
# This script uses for backup RoR applications to S3. Add it as cron task
#1. crontab -e
#2. add this line to the file: 00 04 * * * sh /home/ppolushkin/RoR/obelisk/script/backup.sh

date '+%Y-%m-%d %H:%M' > /home/ppolushkin/RoR/backup_date

mysqldump --opt -u root obelisk_production > /home/ppolushkin/RoR/obelisk_production_dump.sql

s3cmd --guess-mime-type --delete-removed --exclude *.log sync /home/ppolushkin/RoR s3://obelisk-backup