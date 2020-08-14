#监控某服务的脚本
read -p "please input a service name:" sname
while :
do
sstatus=`systemctl status ${sname}|awk -F':' 'NR==3{print $2}'|awk -F' ' '{print $1 $2}'`
echo "`date`该服务的状态为：${sstatus}" >> ./service_log.log
unset sstatus
sleep 60
done
####
####
