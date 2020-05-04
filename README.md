# Docker Image for SAMBA 4 - NAS Container

Based on Alpine Linux

## Run Container

```
$ docker run -it --name nas -p 445:445/tcp -p 139:139/tcp -p 138:138/udp -p 137:137/udp -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro --hostname=Servername -v $(pwd)/multiuser.conf:/conf/multiuser.conf:ro -v /path/to/:/home/test kartoffeltoby/docker-nas-samba:latest
```
