#!/bin/bash

if [ -z "$USER" ]
then
 cat /conf/multiuser.conf | while read LINE
 do
  value=(`echo $LINE | sed 's/:/\n/g'`)
  pass=${value[1]}
  user=${value[0]}
  #echo $user
  #echo $pass
  adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
  echo $pass $user
  echo -e "$pass\n$pass" | smbpasswd -s -a $user
  mkdir -p /home/$user
 done
/etc/init.d/samba start
tail -f /var/log/smb.log
else
 pass="$PASSWORD"
 user="$USER"
 adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
 echo $pass $user
 echo -e "$pass\n$pass" | smbpasswd -s -a $user
 mkdir -p /home/$user
 service samba start
 tail -f /var/log/smb.log
fi
