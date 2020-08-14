#1. ftp自动登录批量下载文件。
#####从ftp服务器上的/home/data 到 本地的/home/databackup####
#!/bin/bash
ftp -n<<!
open 192.168.1.171
user guest 123456
binary
cd /home/data
lcd /home/databackup
prompt
mget *
close
bye
!


#2. ftp自动登录上传文件。
####本地的/home/databackup to ftp服务器上的/home/data####
#!/bin/bash
ftp -n<<!
open 192.168.1.171
user guest 123456
binary
hash
cd /home/data
lcd /home/databackup
prompt
mput *
close
bye
!


#3. ftp自动登录下载单个文件。
####ftp服务器上下载/home/data/a.sh to local /home/databackup####
#!/bin/bash
ftp -n<<!
open 192.168.1.171
user guest 123456
binary
cd /home/data
lcd /home/databackup
prompt
get a.sh a.sh 
close
bye
!


#4. ftp自动登录上传单个文件。
####把本地/home/databachup/a.sh up ftp /home/databackup 下####
#!/bin/bash
ftp -n<<!
open 192.168.1.171
user guest 123456
binary
cd /home/data
lcd /home/databackup
prompt
put a.sh a.sh 
close
bye
!