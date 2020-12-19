#!/bin/bash 

figlet "The Ultimate Bash Script"


echo "---------------------------------------------------------------"
echo ""


#printing hello world
echo "Printing the Hello World"

echo ""
echo "---------------------------------------------------------------"
echo ""


#declaring a var
var="Variable Substitution"
#substituting a var and printing the statement
echo $var


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "File create Section==>"
echo ""

#terminal will prompt for the name 
echo "Please Enter your name: "
#enter the username
read USER_NAME

#print name by substituting specified username
echo "Hello $USER_NAME"

#print a message to create a file of specified username
echo "I will create a file for you called ${USER_NAME}_file.sh"

#touch command will create the file of specified username
touch ${USER_NAME}_file.sh 

#changing the executing permission of the file 
chmod +x ${USER_NAME}_file.sh


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "For loop section==>"
echo ""

#printing statement
echo "This is a for loop in bash scripting: "

#doing for loop for five numbers then do
for i in 1 2 3 4 5 
do 
	#printing all 5 numbers using the substitution of variable
	echo "Looping ... number $i"
done 

echo ""
#printing another for loop statement 
echo "This is another type of for loop in bash scripting: "

#doing for loop for any character then do
for i in hello 1 /"*" 2 goodbye 
do 
	#printing the statement using substitution of variable 
	echo "Looping i is set to $i"
done 


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "While Loop Section==>"
echo ""

#declare a var 
INPUT_STRING=hello

#while loop if input string is not equal to bye then do
while [ "$INPUT_STRING" != "bye" ]
do
	#printing the statement
	echo "Please type something in (bye to quit)."

#taking input from the user
read INPUT_STRING

#printing the result string
echo "You typed: $INPUT_STRING"
done 


echo ""
echo "---------------------------------------------------------------"
echo ""

echo "Grep command section==>"
echo ""

#before running this code, create a file with txt extension and put content of your choice in that file
#changing the directory
cd ~/bash_scripts

#declaring the variable 
My_string=hellfire

#applying the for loop in 
for i in *.txt
do 
	#concatenating the variable and grepping the var	
	cat $i | grep $My_string
done 


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "If-Else statement section==>"
echo ""

#prompting to give input
echo "Please guess the number of cars:"
read X

#applying if condition that if given input is less than 100,then
if [ "$X" -le "100" ]; then

	#printing the statement
	echo "Sorry, not correct"
#else condition
else
	#printing the statement 
	echo "You entered the magic number"
fi 


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "Multiple If statements==>"
echo ""

#prompting for input
echo -en "Please guess the number of cars: "
read X

# substituting variable then grepping the input and redirecting the output and error redirection to /dev/null
echo $X | grep "[^0-9]" > /dev/null 2>&1

#applying if statement that if given input is greater than or equal to 100 then 
if [ "$X" -ge "100" ]; then

	#printing the statement
	echo "Sorry, not correct."
#else statement
else
	#applying if statement that if given input is less than 100, then
	if [ "$X" -lt "100" ]; then
		
		#printing the statement 
		echo "You can in right area."

		#applying if statement that if given input is equal to 7, then
		if [ "$X" -eq "7" ]; then 
	
			#printing the statement
			echo "You entered the magic number" 
		fi
	fi
fi


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "Modified If-Else-If statements==>"
echo ""

#prompting first number
echo "Enter first number: "
read X

#prompting second number
echo "Enter second number: "
read Y

#applying if condition that if X is less than Y and redirecting error to /dev/null
if [ "$X" -lt "$Y" 2>/dev/null ]; then
	echo "$X < $Y"
	
	#applying if condition that if X is less than or equal Y and redirecting error to /dev/null
	else if [ "$X" -le "$Y" 2>/dev/null ]; then
		echo "$X <= $Y"

		#applying if condition that if X is equal to Y and redirecting error to /dev/null
		else if [ "$X" -eq "$Y" 2>/dev/null ]; then
			echo "$X = $Y"
		
			#applying if condition that if X is not equal to Y and redirecting error to /dev/null
			else if [ "$X" -ne "$Y" 2>/dev/null ]; then
				echo "$X != $Y"

				#applying if condition that if X is greater than Y and redirecting error to /dev/null
				else if [ "$X" -gt "$Y" 2>/dev/null ]; then
					echo "$X > $Y"
					
					#applying if condition that if X is greater than or equal to Y and redirecting error to /dev/null
					else if [ "$X" -ge "$Y" 2>/dev/null ]; then
						echo "$X != $Y"
						
						#else if nothing work than 
						else
							echo "You're wrong"
					fi
				fi
			fi
		fi
	fi
fi


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "If-Else condition with While Loop==>"
echo ""

#navigating to bash_scripts directory
cd /home/kali/bash_scripts

#declaring a variable 
xfile=1

#applying loop while reading line variable 
while read line 
do
	#checking that if line variable equals 1, then
	if [ "$line" = "1" ]; then 
		#increasing the count
		((xfile++))
	
	else
		#redirecting all output in xfile  
		echo "$line" >> xfile.txt
	fi
#redirecting input(content) of file.txt into newly created xfile 
done < file.txt


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "Sed command for transformation and filtering of text==>"
echo ""
#create a file in which you can enter either single line statement or multiple line depends on your choice
#I've created a hello.txt file with multiple line statements or you can give input of any file name
#using sed command (stream editor) for transforming and filtering text 
#usage sed command followed by -e(add script to commands to be executed) switch followed by The escaped parentheses 
#\( and \) are used to group parts of matched text that can be back referenced by \1 in the second part of the s-command. 
#At the end of the expression is the letter g, which is the "global" flag, which means that the operation should be repeated
#for every occurrence on the line.


#navigating to bash_scripts directory
cd /home/kali/bash_scripts

#prompting the file name that we want to transform the text
echo "Enter the file name you want to transform or filter the text: "
read FNAME

echo ""
echo "The default content of ${FNAME} is: "
#seeing the content of the file
cat ${FNAME}

echo ""
echo "Transforming content to: "
#using command to transform the text
sed -e 's/:/ |/g' ${FNAME}

#now to save the transformation of statements in a file
echo ""
echo "Enter name of the new file that you want to save the transformation: "
read FILE_NAME
#saving transformation changes to specified file
sed -e 's/:/ |/g' hello.txt > ${FILE_NAME}

echo ""
echo "This is the transformed content of a file:"
#seeing the content of newly generated file
cat ${FILE_NAME}
echo ""
echo "Changes has Been Saved to file ${FILE_NAME}"


echo ""
echo "---------------------------------------------------------------"
echo ""


echo "AWK command section==>"
echo ""

#navigating to bash_scripts directory
cd /home/kali/bash_scripts

#enter the file name you want parse, modify the content
echo "Enter the name of the file:"
read FILE_NAME

#awk command will modify, read, parse the files
#this string will result into printing the first column of the file
awk '{print $1}' $FILE_NAME

#awk command will be used in while loop to create a file which'll contain content and save the output
awk '
BEGIN {
	i=0 
	while ( i<= 61000 )
		{
			print i,0
			i += 50
		}
}' >> output.txt

