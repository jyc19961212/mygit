#把某路径下的文件备份至/data并删除源文件
read -p "please input a dir:" dirname
mv -r ${dirname}/* /data

