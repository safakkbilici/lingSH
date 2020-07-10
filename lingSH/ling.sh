echo "-------------------------------------------------"
echo "Welcome to the text data analysis API, lingSH."
echo "lingSH provides a large text analysis tools."
echo "-------------------------------------------------"

if [ "$#" -ne 1 ]
then
   echo "Argument Error: Give your ~*.txt~ file as an argumet for analyzing"
fi

test ! -f $1 && echo "Type-Exist Error: This file does not exist. You must pass a ~*.txt~ file as an argument"

if [[ $1 != *.txt ]]
then
    echo "Type-Exist Error: You must pass a ~*.txt file as an argument. This file is not a .txt file"
fi
