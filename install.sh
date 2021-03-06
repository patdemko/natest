#!/bin/bash
chmod +x /home/$USER/natest/tests.sh
mkdir /home/$USER/natest/data
echo "service cron start" >> /home/$USER/.bashrc
sudo service cron start
sudo service atd start
sudo usermod -a -G crontab $USER
crontab -l > mycron
echo "*/5 * * * * /home/$USER/natest/tests.sh > /dev/null" >> mycron
crontab mycron
rm mycron
