#!/bin/bash

if [ -n "$USER" ]
then
 cat /conf/multiuser.conf | while read LINE
 do
  value=$(echo $LINE | tr ':' "\n")
  pass=${value[1]}
  user=${value[0]}
  adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
  echo $pass $user
  echo -e "$pass\n$pass" | smbpasswd -s -a $user
  mkdir -p /home/$user
 done
 pass="nopublic"
 user="publicuser"
 adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
 echo $pass $user
 echo -e "$pass\n$pass" | smbpasswd -s -a $user
 mkdir -p /home/$user
 /usr/sbin/smbd -F
else
 pass="$PASSWORD"
 user="$USER"
 adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
 echo $pass $user
 echo -e "$pass\n$pass" | smbpasswd -s -a $user
 mkdir /home/$user
 /usr/sbin/smbd -F
fi
