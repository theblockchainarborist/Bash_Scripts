#! /bin/bash

# First Lets Clear the Terminal.
clear

# Welcome Message
echo "----------------------------------------"
echo "|  Welcome to the Superalgos Helper  |"
echo "----------------------------------------"
echo " "
echo " "

sleep 3s

echo "This script is intened to help you along various parts of your install."
echo "After a few questions this script will:"
echo " "
echo " .........Update & Install Dependencies"
echo " .........Install Superalgos"
echo " .........Install Bitcoin-Factory"
echo " .........Help Troubleshoot Problems"

echo " "
echo " "
echo " "
echo " Currently This Script Works With: "
echo " ..................................Ubuntu "

# First we need to check and see what all the user wants done.
# Should we install dependencies?
echo " Would you like to update and install dependencies? (y/n)"
read -p '(y/n): ' answer
# TestEcho---------
echo "$answer"
# If yes Install_Dependencies = true
if [ "$answer" = "y" ]
then
    Install_Dependencies=true
    echo "$Install_Dependencies"
else
    Install_Dependencies=false
    echo "$Install_Dependencies"
fi

#sleep 3s


#Should we install Superalgos?
echo " Would you like to Install Superalgos?"
read -p '(y/n): ' answer
#TestEcho--------------
echo "$answer"
# If yes Install_Superalgos = true
if [ "$answer" = "y" ]
then
    Install_Superalgos=true
    echo "$Install_Superalgos"
    # Should we Install the Bitcoin_Factory with it?
    echo " Should we also Install Bitcoin-Factory?"
    read -p '(y/n): ' answer
    echo "$answer"
    if [ "$answer" = "y" ]
    then
        Install_BitcoinFactory=true
        echo "$Install_BitcoinFactory"
    else
        Install_BitcoinFactory=false
        echo "$Install_BitcoinFactory"
    fi
else
    Install_Superalgos=false
    echo "$Install_Superalgos"
fi

#sleep 3s

# Check the state of the choices for what to do.
echo "$Install_Dependencies"
echo "$Install_Superalgos"
echo "$Install_BitcoinFactory"

#sleep 5s



# Lets Take in the rest of the required information here before moving on to actions.
if [ "$Install_Superalgos" = "true" ]
then
    echo "Please copy and paste the URL to your Superalgos fork on Github."
    echo "Example URL: https://github.com/theblockchainarborist/Superalgos "
    read -p 'Fork to Clone From: ' usersFork
    echo "$usersFork"
    gotUserFork="true"
fi
#Now we need the Github Token.
if [ "$gotUserFork" = "true" ]
then
    echo "Please Input the Github Token you would like to use."
    read -p 'Github Token: ' token
    echo "$token"
    gotToken="true"
fi






# Let's find out what architecture this machine is running.
aarch_Type=$(uname -m)
if [ "$aarch_Type" = 'x86_64' ]
then
    oS="x86_64"
    echo " The Aarch Type on this PC is "$oS""
fi



###Start Clean Install Steps
#First we move to the home directory.
cd

# Now we setup our dependencies. 
echo "git update & Install"
echo "set download location to nodesource"
echo "node install"
echo "Basic setup is complete"

