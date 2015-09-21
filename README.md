# Docker Image for SAMBA 4 - NAS Container

Based on Debian Jessie

## Run Container

```
$ docker run docker run -it --name nas -p 445:455 -p 137:137 -p 138:138 -p 139:139 -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro --hostname=Servername -e USER=test -e PASSWORD=test -v /path/to/:/home/test KartoffelToby/docker-nas-samba
```
