#!/bin/bash
apt-get update
apt-get upgrade
apt-get install iperf3
chrmod +x /home/$USER/natest/tests.sh
crontab -l > mycron
echo "*/5 * * * * /home/$USER/natest/tests.sh > /dev/null" >> mycron
crontab mycron
rm mycron
