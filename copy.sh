# shell script to copy files or directory in a interective mode 
# features --> 1. if destination directory doesn't exist then create
#		    as per user demand.
#		    2. if source file name already exist then create backup file with numeric extention
#
# Input    --> two arguments, first source file or directory name and second destination directory
#

if [ $# -ne 2 ]
then
	echo "Error : too few arguement.";
else 
	
	if [ ! -d $1 -a ! -f $1 ]
	then
		echo "Error : $1 : No such file or directory exist.";
		exit;
	fi
	if [ ! -d $2 ]
	then
		echo "Warning : $2 : No such directory exist.";
		echo -e "do you want to create $2 directory(yes/no)?? \c";
		read ch;
		case $ch in
			[Yy][Ee][Ss]) mkdir $2;;
			[Nn][Oo]|*) exit;
		esac
	fi
	if [ ! -f $2/$1 -a ! -d $2/$1 ]
	then
		cp -r $1 $2;
		echo "File $1 copied to $2."
	else
		c_nu=1;
		while true
		do
			if [ ! -f $2/$1.$c_nu -a ! -d $2/$1.$c_nu ]
			then
				cp -r $1 $2/$1.$c_nu;
				echo "File $1 copied to $2 as $1.$c_nu";
				break;
			else
				c_nu=`expr $c_nu + 1`;
			fi
		done
	fi
fi

#
# Author : Harshit Shaarma
#
