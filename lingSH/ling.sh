echo "-----------------------------------------------------------------------------------"
echo "Welcome to the text data analysis API, lingSH."
echo "lingSH provides a large text analysis tools."
echo "LingSH creates and writes a file your specific data analysis choices in lingSH.txt"
echo "-----------------------------------------------------------------------------------"

if [ "$#" -ne 1 ]
then
   echo "Argument Error: Give your ~*.txt~ file as an argumet for analyzing"
fi

test ! -f $1 && echo "Type-Exist Error: This file does not exist. You must pass a ~*.txt~ file as an argument"

if [[ $1 != *.txt ]]
then
    echo "Type-Exist Error: You must pass a ~*.txt file as an argument. This file is not a .txt file"
fi

while true; do
    echo "For frequency listing, type : 'f'"
    echo "For tokenizing, press : 't'"
    echo "For translating, press: 'c'"
    echo "Input: "
    read -r input
    if [[ $input == "f" ]]
    then
	echo "For listing specific words'/word's frequency listing, type : 'r'"
	read -r regex
	if [[ $regex == 'r' ]]
	then
	    echo "Type its RegEx format (i.e, '\<[Aa]nd\>'): "
	    read -r regex
	    tr -sc 'A-Za-z' '\n' < shakes.txt | sort | uniq --count | sort -n -r | grep $regex > lingSH.txt
	fi
	
    fi
    
done

