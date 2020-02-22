mkdir $3
files=$(find $1 -name "*.${2}")
for i in $files; do
	filename=$(basename -- "$i")
	extention="${filename##*.}"
	filename="${filename%.*}"
	basefilename=$filename
	x=1
	while [ -f "./$3/$filename.$extention" ]
	do
		filename=${basefilename}_${x}
		x=$(($x+1))
	done
	cp $i ./$3/$filename.$extention
done
tar cfz $4 --absolute-names $3
echo done
exit 0
