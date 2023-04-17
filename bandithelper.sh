#!/bin/bash

#To clear the screen

echo $(clear)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#functions
option=""
selectlevel=""
passwd=""
whilelvl=""
conection=""
batcat=$(bat --version)
if [ $? = 0 ]
then
  batcat="yeah"
else
  batcat="No"
fi
lastpasswd=$(grep -v '^[[:space:]]*$' usr\&passwd.log | sort -u | tail -n 1 | awk '{print $6}')

#Logo
echo -e "${redColour}
 ____                  _ _ _   _   _      _                 
| __ )  __ _ _ __   __| (_) |_| | | | ___| |_ __   ___ _ __ 
|  _ \ / _\`| \'_ \ / _\` | | __| |_| |/ _ \ | '_ \ / _ \ '__|
| |_) | (_| | | | | (_| | | |_|  _  |  __/ | |_) |  __/ |   
|____/ \__,_|_| |_|\__,_|_|\__|_| |_|\___|_| .__/ \___|_|   
                                           |_|${endColour}"
echo -e "${yellowColour}(by ryoxao)${endColour}\n"

#options + while
while [ "$option" != "1" ] && [ "$option" != "2" ] && [ "$option" != "3" ] && [ "$option" != "4" ]
do 
  echo -e "${greenColour}Select a Option${endColour} ${redColour}[1/2/3/4]${endColour} :"
  echo -e "${redColour}[1]${endColour} ${purpleColour}First time on bandit?, chose this option.${endColour}"
  echo -e "${redColour}[2]${endColour} ${purpleColour}Start bandit.${endColour} "
  echo -e "${redColour}[3]${endColour} ${purpleColour}Logs.${endColour} "
  echo -e "${redColour}[4]${endColour} ${purpleColour}Exit.${endColour}"
  read option

  case "$option" in
    1) 
      #condition1
      echo $(clear)
      echo -e "${purpleColour}Bandit is a game made by OverTheWire that teaches how to use linux comands. It is made for beginners, although it is also suitable for people who have been using Linux for a while.${endColour}"
      echo -e "${purpleColour}The first thing you do is connect to their servers by ssh (SSH is the name of a protocol and the program that implements it whose main function is remote access to a server through a secure channel in which all information is encrypted. ), once there you have access to a terminal of a user called bandit 0${endColour}"
      echo -e "${purpleColour}for more information, plis visit : https://overthewire.org/wargames/bandit/${endColour}"
      echo -e "${purpleColour}once you had read all this, you are ready to start.${endColour}"
      echo -e "${purpleColour}Press enter to return to the menu...${endColour}"
      read 
      echo $(clear)
      option=""
      ;;
    2) 
      echo $(clear)
      ;;
    3)
      echo $(clear)
      ;;
    4)
      ;;
    *) 
      echo -e "${redColour}[+]${endColour} ${purpleColour}select a option between 1-3${endColour}"
      read
      echo $(clear)
      ;;
  esac

done
#condition2
if [ $option -eq 2 ]
  then
    echo -e "${redColour}[+]${endColour} ${purpleColour}Select a lvl between 0-34${endColour}"
    echo -e "${redColour}[+]${endColour} ${purpleColour}Press Q to exit${endColour}"
    read selectlevel
    echo $(clear)
    
    while [ "$selectlevel" != "Q" ]
      do
        if [ "$selectlevel" = "" ]
        then  
          echo -e "${redColour}[+]${endColour} ${purpleColour}Select a lvl between 0-34${endColour}"
          echo -e "${redColour}[+]${endColour} ${purpleColour}Press Q to exit this menu${endColour}"
          read selectlevel
          echo $(clear)
        fi
        if [ "$selectlevel" = "Q" ]
        then
          exit
        elif [ "$selectlevel" = "0" ]
        then
          echo -e "${purpleColour}The goal on this level is conect by ssh to the server of overthewire, but this tool was make to make easier the conection, so i'll teach you how to make a ssh conection${endColour}"
          read
          echo -e "${purpleColour}First of all, as it says on the as it says in the welcome part for begginers in the menu, a ssh is a protocol that alows you to remote access a server or a computer${endColour}"
          read
          echo -e "${purpleColour}all the conection is encrypted, to make the conection you have to follow a equation : \"ssh [user]@[public_ip or dns]\", this makes conection with the port 22 by defaul${endColour}"
          read
          echo -e "${purpleColour}if you want to conect to another port, you have to put \"-p\" and the port that you want to conect. \"ssh [user]@[public_ip or dns] -p [port]\"${endColour}"
          read
          echo -e "${purpleColour}in this case overthewire wants us to conect to the port 2220 and they dns is bandit.labs.overthewire.org, if the user is bandit0 and the passwd is bandit0, how would look the conection?${endColour}"
          read
          echo -e "${purpleColour}Exactly, the conection would look lke : \"ssh bandit0@bandit.labs.overthewire.org -p 2220\" i'll lunch another terinal where i'll run this comand.${endColour}"  
          read
          echo $(gnome-terminal -e "/usr/bin/ssh bandit0@bandit.labs.overthewire.org -p 2220")
          read -p "Waiting until you close the terminal of the conection with the bandit servers, When you will close it Press Enter..."
          selectlevel=""
        elif [ "$selectlevel" != "0" ]
        then
          if [ "$passwd" = "" ]
          then
            echo -e "${redColour}[+]${endColour} ${purpleColour}Enter the passwd of the user bandit$(echo $selectlevel)${endColour}"
            read passwd
            echo $(clear)
            #echo echo $(gnome-terminal -e "/usr/bin/sshpass -p "$passwd" /usr/bin/ssh bandit$selectlevel@bandit.labs.overthewire.org -p 2220")
            echo $(gnome-terminal -- /bin/bash -c "/usr/bin/sshpass -p $passwd /usr/bin/ssh bandit$selectlevel@bandit.labs.overthewire.org -p 2220; exec /bin/bash" & )
            echo $(echo -e "usr : bandit$selectlevel; passwd : "$passwd"\n">>"usr&passwd.log")
            read -p "Waiting until you close the terminal of the conection with the bandit servers, When you will close it Press Enter..."
            selectlevel=""
            passwd=""
          fi
        fi
      done
fi
#condition3
if [ $option -eq 3 ]
then
  echo -e "Select what do you want to do with the logs"
  echo -e "[1] Show me the logs"
  echo -e "[2] Print me the last passwd that had been stored"
  echo -e "[3] I want to clear the logs"
  read logsopt
  echo $(clear)
  if [ $logsopt -eq 1 ]
  then
    echo "[+] Checking if the file exists..."
    sleep 1
    echo $([ -e usr\&passwd.log ])
    if [ $? = 0 ]
    then  
      echo "the log file exists"
      echo "[+] Checking if the file is empty..."
      sleep 1
      if [ -s usr\&passwd.log ]
      then
        echo "the log file isn't empty"
        echo "Printing the log file :"
        echo $(grep -v '^[[:space:]]*$' usr\&passwd.log | sort -u)
      else
        echo "the log file is empty"
      fi
    else
      echo "the log file doesn't exists"
    fi
  elif [ $logsopt -eq 2 ]
  then
    if [ -s usr\&passwd.log ]
    then
      if [ "$lastpasswd" = "" ] || [ "$lastpasswd" = " " ] || [ "$lastpasswd" = ":" ]
      then
        echo "Can't print the passwd because the last passwd of the usr$(grep -v '^[[:space:]]*$' usr\&passwd.log | sort -u | tail -n 1 | awk '{print $3}' | tr ";" " ") is empty"
        echo "It might be because you press enter in the input of \"Enter the passwd of the usr banditX\""
        echo "Or just the log file is empty"
        read -p "Press enter to exit..."
      else
        echo -e "[+] Printing the last passwd that is for the usr : $(grep -v '^[[:space:]]*$' usr\&passwd.log | sort -u | tail -n 1 | awk '{print $3}' | tr ";" " ")\n"
        echo -e "\"$(grep -v '^[[:space:]]*$' usr\&passwd.log | sort -u | tail -n 1 | awk '{print $6}')\"\n"
        read -p "Press enter to exit..."
        echo $(clear)
      fi
    else
      echo "Can't print the last passwd because the file is empty"
      read
    fi
  elif [ $logsopt -eq 3 ]
  then 
    echo "Cleaning the log file..."
    sleep 2
    echo $(rm "usr&passwd.log")
    echo $(touch "usr&passwd.log")
    echo "Done, the log file now is empty"
  fi
fi

if [ "$option" = "4" ]
then
  echo $(clear)
fi