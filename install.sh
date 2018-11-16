#!/bin/bash
chmod +x /home/$USER/natest/tests.sh
mkdir /home/$USER/natest/data
service cron start
service atd start
sudo usermod -a -G crontab $USER
crontab -l > mycron
echo "*/5 * * * * /home/$USER/natest/tests.sh > /dev/null" >> mycron
crontab mycron
rm mycron
