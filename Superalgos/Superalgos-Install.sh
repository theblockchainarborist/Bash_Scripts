#! /bin/bash
#
#
### First Up Is All The Functions That Will Be Used.
#
# This is the install control function.
function installController() {
    getUserInfo
    giveUserPermissions
    getDependencies
    initSetup
    clone
}
#
# Here We Get The Needed User Info To Complete The Install.
function getUserInfo() {
    echo " What is your github user name?"
    read -p '(UserName): ' username
    echo " Welcome "$username" "
    sleep 2s
    echo " What is the URL of your Superalgos Fork?"
    read -p '(ForkURL): ' fork
    sleep 2s
    echo " What github token would you like to use?"
    read -p '(Token): ' token
    echo " The Install Script Is About To Begin."
    sleep 3s
    clear
}
#
# Here We Give The User The Needed Permissions.
function giveUserPermissions() {
    user=$(whoami)
    echo "$user"
    echo " Please Input Your User Password To Allow For sudo Commands"
    echo "sudo usermod -aG sudo "$user" "
    sleep 3s
}
#
# Here We Install The Main Dependencies.
function getDependencies() {
    echo "apt-get install git"
    echo "curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash - && sudo apt-get \install -y \nodejs npm git python3"
}
#
# Here We Will Move Clone Superalgos To The Home Directory.
function clone() {
    cd ~
    ls
    sleep 5s
    echo "$fork"
}
#
## Here We Setup Superalgos By Utilizing The Existing Install Scripts.
function initSetup() {
    echo "cd Superalgos"
    echo "node setup"
    echo "node setupPlugins "$username" "$token""
}
#
# Lets Clear the Terminal So Everything Starts Neat And Tidy.
clear
#
# Welcome Message
echo "----------------------------------------"
echo "|  Welcome to the Superalgos Install   |"
echo "----------------------------------------"
echo " "
echo " "
sleep 2s
echo "This script is intened to be used to install Superalgos on Ubuntu"
echo "This is inteneded to be A convience installation method"
echo "After a few questions this script will:"
echo " "
echo " .........Check and install / update all dependencies"
echo " .........Clone your Superalgos Fork to this machine"
echo " .........Setup Superalgos Plugins"
echo " .........Optional Docker Install Option For Bitcoin-Factory"
echo " "
echo " "
echo " "
sleep 5s
clear
# Here We Will Find Out What All The User Would Like Us To Do.
echo " Would you like us to install Superalgos?"
echo " Note: Superalgos will be installed inside the home directory."
read -p '(y/n): ' choice
if [ "$choice" = "y" ]
then
    install="y"
    echo " OK"
    sleep 1s
    echo " We Will Need To Ask You A Few Questions To Continue"
    sleep 3s
    installController
else
    install="n"
    echo " OK"
    sleep 1s
    echo " Would You Like To Install Docker Then?"
        read -p '(y/n): ' choice
        if [ "$choice" = "y" ]
        then
            docker="y"
            echo " We Will Also Install Docker!"
        else
            docker="n"
        fi
fi


