read -p "please input a file name:" filename
cp -r $filename .${filename}
md1=`md5sum .${filename}|awk -F' ' '{print $1}'`
while :
do
md2=`md5sum ${filename}|awk -F' ' '{print $1}'`
if [ $md2 != $md1 ]
then
echo "文件被篡改！"
cp -f .$filename $filename
echo "文件恢复成功！"
else
echo "文件正常！"
fi
sleep 10
done

123123312
123132123