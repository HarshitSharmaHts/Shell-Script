#rev.sh : progrsm to reverse any number
#input  -> any integer number
#output -> reverse integer number of input

clear
echo -e "Enter any number   :   \c"
read num;
s_um=0;
n=0;
while [ $num != 0 ]
do
	n=$((num%10))
	num=$((num/10))
	s_um=$((s_um*10+n));
done
echo "Reverse number     :   $s_um"
exit

#
# Author : Harshit Sharma
#
