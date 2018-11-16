#!/bin/bash
sudo chmod +x /home/$USER/natest/tests.sh
crontab -l > mycron
echo "*/5 * * * * /home/$USER/natest/tests.sh > /dev/null" >> mycron
crontab mycron
rm mycron
