#! /bin/bash
#
#
### First Up Is All The Functions That Will Be Used.
#
# This is the install control function.
function installController() {
    getSystemInfo
    wait
    getUserInfo
    wait
    giveUserPermissions
    wait
    getDependencies
    wait
    getDocker
    wait
    cloneFork
    wait
    initSetup
    wait
    showFinishMessage
}
#
## Here we will gather what system info we can as to install the correct stuff.
function getSystemInfo() {
    #Name the current operating system.
osName=$(uname)
    #What bit is the system?
osBit=$(getconf LONG_BIT)
echo "We are running on a "$osName" system that is "$osBit"bits from what we can tell."
sleep 10s
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
    givesudo="sudo usermod -aG sudo "$user""
    eval $givesudo
    wait
}
#
# Here We Install The Main Dependencies.
function getDependencies() {
    echo "## Getting Node From NodeSource............................."
    dependencies="curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -"
    eval $dependencies
    wait
    echo "## Getting Nodejs"
    getnode="sudo apt-get install -y nodejs"
    eval $getnode
    wait
    sleep 20s
}
#
## If the user wants docker, the user gets docker.
function getDocker() {
if [ "$docker" = "y" ]
then
    echo "## Getting ready to get docker from docker.com............."
    locationD="curl -fsSL https://get.docker.com -o get-docker.sh"
    eval $locationD
    wait
    echo "## Getting docker.........................................."
    getDocker="sudo sh get-docker.sh"
    eval $getDocker
    wait
fi    
}
#
# Here We Will Clone Superalgos To The Home Directory.
function cloneFork() {
    echo "## Preparing to clone your fork............................"
    echo "# First we move to the home directory......................"
    movehome="cd ~"
    eval $movehome
    wait
    echo "## Cloning Fork............................................"
    clone="git clone "$fork""
    eval $clone
    wait
    echo "## Fork Cloned"
    sleep 5s
}
#
## Here We Setup Superalgos By Utilizing The Existing Install Scripts.
function initSetup() {
    echo "## Preparing to setup Superalgos..........................."
    homeS="cd ~/Superalgos"
    eval $homeS
    wait
    echo "Running node setup script.................................."
    setup="node setup"
    eval $setup
    wait
    echo "## Running node setupPlugins script........................"
    plugins="node setupPlugins "$username" "$token""
    eval $plugins
    wait
    sleep 5s
}
#
## Show a Finish Message
function showFinishMessage() {
    echo "This Script has Finished Executing!"
    echo "Everything should be all setup for you!"
    echo "To run Superalgos just use the "node platform" command!"
    sleep 10s
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
    echo " Would you like us to install docker?"
    read -p '(y/n): ' choice
    if [ "$choice" = "y" ]
    then 
        docker="y"
        echo " OK, We will also install docker!"
    fi
    sleep 2s

    echo " We Will Need To Ask You A Few More Questions To Continue"
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
            echo " We Will Install Docker!"
        fi
fi


