#!/bin/bash

VERSION="THE 8th."

echo "Hello Rust!";
echo "This is $VERSION version.";
echo "Are you Ready?";

ls -lah| grep tmp;
whoami;
pwd;
cat README.md;

if [[ $(ls| grep tmp) != ""
&& $(ls -lah| grep tmp| wc -L) -gt 5 ]]
then
    for i in `seq 20`
    do
	res[$i]=$(date +%s%N | md5sum | cut -c 1-9);
    done

    res2=$(echo ${res[@]}| sort | uniq -c | sort -rn -k1);
   
    rm $(ls| grep -E ^[0-9]{2}[0-9]*$)

    filename=$RANDOM;
    echo "This is $VERSION random data: $res2" 1>"./$filename";
    cat $filename;

else
    echo "That's it!";

fi

echo "DONE!";
