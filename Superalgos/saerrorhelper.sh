#! /bin/bash

# First Lets Clear the Terminal.
clear

# Welcome Message
echo "--------------------------------------------"
echo "|  Welcome to the Superalgos Error Helper  |"
echo "--------------------------------------------"
echo " "
echo " "

sleep 3s

echo "This script is intened to help you with common errors."

sleep 5s

echo "Let's start by narrowing things down."

sleep 3s

echo "What where you doing when the error happened?"

sleep 1s

echo "Please input the number assigned to the choice you would like to make."
echo " "
echo " "
echo "....1....Installation"
echo "....2....Bitcoin Factory"
echo "....3....Data Mining"

# Get and Read the User Input
read -p 'Num/Choice: ' answer
echo " You chose "$answer""

# Assign the right name to the answer.
# Here we use Case Syntax
case "$answer" in

    "1")
    choice="Installation"
    echo "You chose "$choice"!"
    ;;

    "2")
    choice="Bitcoin Factory"
    echo "You chose "$choice"!"
    ;;

    "3")
    choice="Data Mining"
    echo "You chose "$choice"!"
    ;;
    
esac



function computeLag() {
    sleep 3s
    echo "beep"
    sleep 2s
    echo "boop"
    sleep 2s
    echo "bop"
    sleep 5s
    echo "We might have found a solution to your problem!"
}

computeLag


