git pull
grep --include=\*.h --include=\*.c -rnwl . -e "#include <stdio.h>" | while read -r result; do
	echo "#include <openssl/bn.h>" >> temp.txt
	cat $result >> temp.txt
	cp temp.txt $result
	rm temp.txt
	echo $result >> files.txt
done
git add .
git commit -m "added #include<openssl/bn.h> line"
git push
