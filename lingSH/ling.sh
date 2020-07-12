echo "-----------------------------------------------------------------------------------"
echo "Welcome to the text data analysis API, lingSH."
echo "lingSH provides a large text analysis tools."
echo "LingSH creates and writes a file your specific data analysis choices in lingSH.txt"
echo "If you change a file, (i.e, punctuation marks to '\n' translation), the software will use changed file"
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
i=0
while true; do
    echo "For frequency listing, type : 'f'"
    echo "For tokenizing, press : 't'"
    echo "For translating, press: 'c'"
    echo "Input: "
    read -r input
    if [[ $input == "f" ]]
    then
	echo "For listing specific words'/word's frequency listing, type 'r' :"
	read -r regex
	if [[ $regex == 'r' ]]
	then
	    echo "Type its RegEx format (i.e, '\<[Aa]nd\>'): "
	    read -r regex
	    tr -sc 'A-Za-z' '\n' < $1 | sort | uniq --count | sort -n -r | grep $regex > lingSH.txt
	else
	    tr -sc 'A-Za-z' '\n' < $1 | sort | uniq --count | sort -n -r > lingSH.txt
	fi	
    fi
    if [[ $input == 'c' ]]
    then
	echo "For upper-case to lower-case, type 'u2l' : "
	echo "For lower-case to upper-case, type 'l2u' : "
	read -r ul
	if [[ $ul == "u2l" ]]
	then
	    tr "[:upper:]" "[:lower:]" < $1 > "$i$1"
	    i=i+1
	fi
	if [[ $ul == "l2u" ]]
	then
	    tr "[:upper:]" "[:lower:]" < $1 > "$i$1"
	    i=i+1
	fi
    fi
    
done

