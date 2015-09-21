#!/bin/bash

pass="$PASSWORD"
user="$USER"
adduser --quiet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-login --shell /bin/false --home /home/$user/ $user -q
echo $pass $user
echo -e "$pass\n$pass" | smbpasswd -s -a $user
mkdir /home/$user
/etc/init.d/samba start
tail -f /var/log/dmesg
