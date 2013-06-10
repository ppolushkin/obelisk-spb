#!/bin/sh
# This script uses copy changes from DEV side to production Tiny server
# 1. use this script to copy changes to tiny server
date '+%Y-%m-%d %H:%M' > /home/engage/obelisk/change_date
rsync -avz --delete --exclude="log*" --exclude="tmp*" --exclude=".git" --exclude=".idea" --exclude="public/images/foto*" /home/engage/obelisk ppolushkin@venki-spb.ru:/home/ppolushkin/RoR
# 2. give read permissions for all files in public folder
# chmod a+r -R /home/ppolushkin/RoR/obelisk/public
# 3. then restart apache server
# sudo /etc/init.d/apache2 restart
# 4. migrate db if needed
# rake db:migrate RAILS_ENV="production"