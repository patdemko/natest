# natest
1. Activate [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) on Windows 10 Machine and reboot.
2. Install [Ubuntu](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab) app.
3. Start Ubuntu and create a user.
4. Update & Upgrade system (sudo apt-get update & sudo apt-get upgrade)
5. Install iperf3 (sudo apt-get install iperf3)
6. Edit tests.sh file to enter your testing parameters
7. chmod +x install.sh
8. Run ./install.sh as non-root user to setup cron
