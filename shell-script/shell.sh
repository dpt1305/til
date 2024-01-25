#!/bin/bash 
echo "Hello world"
i=0
a=1

# if command
echo "------- if command -------"
if [ $i -eq 1 ] 
then
    echo "1"
    # exit 0
elif [ $a -ne 0 ]
then 
    echo "2"
    # exit 1
else
    echo "3"
fi

# for loop
echo "----- for loop -------"
for var in  1 2 3 
do
    echo "$var"
done

# while loop
echo "----- while loop -------"
a=0
while [ $a -le 5 ] 
do
    echo "$a"
    a=`expr $a + 1`
done

# function
echo "------- function -------"
function hello() {
    echo "Hello $@"
    now
} 
function now() {
    echo "$(date)"
}
hello Aden Troy 
echo " $time";
