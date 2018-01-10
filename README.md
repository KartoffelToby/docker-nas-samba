# Docker Image for SAMBA 4 - NAS Container

Based on Debian

## Run Container

```
$ docker run -it --name nas -p 445:455 -p 137:137 -p 138:138 -p 139:139 -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro --hostname=Servername -v $(pwd)/multiuser.conf:/conf/multiuser.conf:ro -v /path/to/:/home/test kartoffeltoby/docker-nas-samba
```
