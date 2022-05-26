#   Bash Shell Scripting

Commands Can be Put inside of a .txt file and have the bash shell read those commands.

 ## To write a basic bash script
  - Run the following commands.
    ```
    vi basicscript.sh
    ```
     - basicscript is the file name we are creating, and .sh is the extension.
  - First line in every bash script is the path to the shell we want to exicute that script.
    ```
    #!/bin/bash
    ```
  - Now we start adding our commands, 1 command per line.  

  -Once done, escape out.
  - To the the bash script/
    ```
    bash basicscript.sh
    ```
    - Bash is the shell we want to execute the script.
    - basicscript.sh is the script we want to execute.
  - 2d way to execute bash script.
    ```
    chmod 775 basicscript.sh
    ```
    - Once executable the script can be run with.
        ```
        ./basicscript.sh
        ```

## General Notes:
 - The $@ symbol is a variable that is anything put into the command line after the script run command.
 - $1 only gives the first option imputted after run command.
   - Example:
        ```
        ./basicscript.sh Hello World
        ```
        - $1 would call the variable = to "Hello"
        - $@ would call all variables = "Hello World"


## Read Data from the user.
 - The following commands will ask the user for input.
    ```
    echo "Enter a value: "
    ```
    ```
    read userInput
    ```
    ```
    echo "You just entered ${userInput}"
    ```
    - User imput is a variable that the input the user gives is stores under.
  - Read user input and then use that input.
    ```
    echo "Enter a file extension: "
    ```
    ```
    read ext
    ```
    ```
    touch "yourfile.${ext}"
    ```

## Check if a file exists.
 - The following is a basic if check in bash scripting.
    ```
    if [ -d /etc/sysconfig ]; then
            echo "That file is there and a directory"
    else
           echo "Not there or not a directory"
    fi
    ```
    - What happens above:
      - Line 1 checks to see if everything between brackets is true or false.
      - If Line 1 is true than it executes line 2.
      - If line 1 is false than executes line 3-4.
      - -d saids "Does this item exist and is it a directory?"

## Loops
 - This is what a loop looks like in bash.
    ```
    for i in $(seq 10)
    do
        echo "Value is: $i"
    done
    ```
    - the $(seq 10) is grabbing the output so we can do something with it and stores it in "i"






Side notes for SA Fix-
    sudo node platform |& tee -a terminalOutputCopy.txt
    (outputTest.txt is the file name we are copying SA terminal output to.)

For sorting and getting the desired data.
grep "Downloading" outputTest.txt > outputTest2.txt



Run whatever console you want to be able to sort through with the following command. In my example I run superalgos and make a copy of that console output.

    " sudo node platform |& sudo tee -a terminalOutputCopy.txt "

    (terminalOutputCopy.txt is just the files name that is either being created or copied to.)

Then to sort through the terminal looking for say my username (or any string you want to check for) run:

    " grep "theblockchainarborist" terminalOutputCopy.txt > sortedTOC.txt "

    (sortedTOC.txt is a new file that we are now saving our sorted data to.)
    (for me for this to work I needed to use "sudo su" to get root access before running the above.)

Then just view the sortedTOC.txt file to see what was found in "terminalOutputCopy.txt" that match's the string "theblockchainarborist". Each time the "grep" command is run it saves over the same sortedTOC.txt file.

