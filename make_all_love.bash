#! /bin/bash
# love2d 32bit export script for linux 
loveexe_path="./LOVE2D";
c=2
for n in *.love ; do
	love_name=${n:0:${#n}-5}
	cat ${loveexe_path}/love.exe $n > ${love_name}.exe
	echo ">> $n to ${love_name}.exe ok"
	if [ ! -d "${love_name}" ];then mkdir ${love_name} ;fi
	if [ ! -f "${love_name}/love.dll" ];then cp ${loveexe_path}/*.dll ${love_name} ;fi 
	if [ -f "${love_name}.exe" ];then mv ${love_name}.exe ${love_name} ;fi
	while [[ c!=1 && c!=0 ]] ;do
		echo "do you want zip game? 1/yes 0/no "
		read c
		if [ c==1 ];then
			if [ ! -f "${n:5:${#n}-10}.zip" ];then zip -r ${love_name}.zip ${love_name};echo ">> build ${love_name}.zip ok" ;fi	
		else
			break;
		fi
	done
done
