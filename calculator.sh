#
#
# script of a basic calculator with five operation (add, subtract, multiplication, division, power)
# 
#

add()
{
	echo `expr $1 + $2`
}

sub()
{
	echo `expr $1 - $2`
}

mul()
{
	echo `expr $1 \* $2`
}

div()
{
	echo -e "scale=3\n$op1$oper$op2" | bc
}

exp()
{
	ans=1
	i=0
	while [ $i -ne $2 ]
	do
		ans=$((ans*$1))
		i=$((i+1))
	done
	echo $ans
}
while true
do
	echo -e "a=\c"
	read op1
	
	echo -e "b=\c"
	read op2
	echo;echo "Press any number [0-9] for exit"
	echo -e "(+, -, *, /, ^) ??\c";
	
	read oper
	
	case $oper in
		"+")
			
			ans=`add $op1 $op2`
			;;
		"-")
			ans=`sub $op1 $op2`
			;;
		"*")
			ans=`mul $op1 $op2`
			;;
		"/")
			ans=`div $op1 $op2`
			;;
		"^")
			ans=`exp $op1 $op2`
			;;
		[0-9])
			exit;;
		*)
			echo "invalid operation.." ;;
	esac
	echo "$op1 $oper $op2 = $ans"
	echo;echo;
done

#
# Author : Harshit Sharma
#
