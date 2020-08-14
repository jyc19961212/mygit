#!/bin/bash
#此脚本用于每天定时将生成的数据文件上传到客户FTP服务器
#指定上传文件所在的主目录
SRCDIR=/tmp/test_jr/getfile/files/
#指定所需上传对端FTP服务器的目录
DESDIR=/JRAQ_FILE/
#指定对端FTP服务器的用户名和密码
USER=finftp
PASSWD="ABC@123"
#指定目标FTP服务器的IP
IP=3.3.3.3
#指定目标FTP服务器端口，一般都是默认
#PORT=21
#指定所要上传文件的日期
targetDay=`date`
#获取所要上传的文件
cd $SRCDIR
for host in 192.168.1.B 192.168.1.C 192.168.1.D
do
    scp root@$host:$SRCDIR/$targetDay_*_Result.csv ./
done
#判定文件是否获取正确
[ $? -eq 0 ] || echo "Copy romote files failed, pls check." >>$SRCDIR/upload_file.log

#上传文件到FTP服务器
ftp -ivn <<EOF
    open $IP $PORT
    user $USER $PASSWD
    binary
    cd $DESDIR
    lcd $SRCDIR
    put ${targetDay}_*_Result.csv
    quit
EOF

#判定文件是否上传成功
[ $? -eq 0 ] && echo "Upload $targetDay's files to romote FTP server successful." >>$SRCDIR/upload_file.log || echo "Upload files failed, pls check." >>$SRCDIR/upload_file.log