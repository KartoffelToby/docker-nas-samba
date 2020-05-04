#!/bin/bash
cat /conf/multiuser.conf | while read -r LINE; do
    value=(`echo $LINE | sed 's/:/\n/g'`)
    pass=${value[1]}
    user=${value[0]}
    addgroup $user && adduser --home "/home/$user" -D -H -G $user -s /bin/false $user
    echo -e "$pass\n$pass" | smbpasswd -a -s -c /etc/samba/smb.conf $user
    mkdir -p /home/$user
    chmod -R 777 /home/$user
done
smbd -F -S --no-process-group