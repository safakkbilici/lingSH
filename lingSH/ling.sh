echo "----------------------------------------------------------------------------------------------------------"
echo "Welcome to the text data analysis API, lingSH."
echo "- lingSH provides a large text analysis tools."
echo "- LingSH creates and writes a file your specific data analysis choices in lingSH.txt."
echo "- If you change a file, (i.e, punctuation marks to '\n' translation), the software will use changed file."
echo "- Reverse for conditional statements is 'rev'."
echo "----------------------------------------------------------------------------------------------------------"

if [ "$#" -ne 1 ]
then
   echo "Argument Error: Give your ~*.txt~ file as an argumet for analyzing"
fi

test ! -f $1 && echo "Type-Exist Error: This file does not exist. You must pass a ~*.txt~ file as an argument" && exit 1

if [[ $1 != *.txt ]]
then
    echo "Type-Exist Error: You must pass a ~*.txt file as an argument. This file is not a .txt file"
    exit 1
fi
i=0
j=0
file=$1
while true; do
    echo "For frequency listing, type : 'freq'"
    echo "For tokenizing, type : 'tok'"
    echo "For translating, type: 'tr'"
    echo "For stemming, type: 'stem'"
    echo "For continue with another/changed file, type: 'cf'"
    echo "To see which file is used, type: 'pwdf'"
    printf "Input: "
    read -r input
    if [[ $input == "quit" ]]
    then
	exit 1
    fi   
    if [[ $input == "pwdf" ]]
    then
	echo "[[You are using $file]]"
    fi
    
    if [[ $input == "cf" ]]
    then
	printf "Type your file's name: "
	read -r newfile
	file=$newfile
    fi
    
    if [[ $input == "freq" ]]
    then
	printf "For case-sensitive searching, type 'c': "
	read -r case
	if [[ $case == 'c' ]]
	   then
	       printf "For listing specific words'/word's frequency listing, type 'r': "
	       read -r regex
	       if [[ $regex == 'r' ]]
	       then
		   printf "Type its RegEx format (i.e, '\<[Aa]nd\>'): "
		   read -r regex
		   tr -sc 'A-Za-z' '\n' < $file | sort | uniq --count | sort -n -r | grep $regex > "$j.txt"
		   echo "[[Printed to $j.txt]]"
		   let "j=j+1"
	       else
		   tr -sc 'A-Za-z' '\n' < $file | sort | uniq --count | sort -n -r > "$j.txt"
		   echo "[[Printed to $j.txt]]"
		   let "j=j+1"
	       fi
	else
	    printf "For listing specific words'/word's frequency listing, type 'r': "
	    read -r regex
	    if [[ $regex == 'r' ]]
	       then
		   printf "Type its RegEx format (i.e, '\<[Aa]nd\>'): "
		   read -r regex
		   tr -sc 'A-Za-z' '\n' < $file | tr 'A-Z' 'a-z'  |sort | uniq --count | sort -n -r | grep $regex > "$j.txt"
		   echo "[[Printed to $j.txt]]"
		   let "j=j+1"
	    else
		tr -sc 'A-Za-z' '\n' < $file | tr 'A-Z' 'a-z'  | sort | uniq --count | sort -n -r > "$j.txt"
		echo "[[Printed to $j.txt]]"
		let "j=j+1"
	    fi
	fi
    fi
    
    if [[ $input == 'tr' ]]
    then
	printf "For [upper/lower] case translation, type [u2l/l2u]: "
	read -r ul
	if [[ $ul == "u2l" ]]
	then
	    tr "[:upper:]" "[:lower:]" < $1 > "$i$file"
	    echo "[[Printed to $i$file]]"
	    let "i=i+1"
	fi
	if [[ $ul == "l2u" ]]
	then
	    tr "[:lower:]" "[:upper:]" < $1 > "$i$file"
	    echo "[[Printed to $i$file]]"
	    let "i=i+1"
	fi
    fi
    echo ""
done

