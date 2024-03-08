#!/usr/bin/bash
#!/usr/bin/sage
if (test "$#" -lt 2 )
then
	echo Please give two arguments, with first being pi or e and second being the digit between 1 and 200 that you want to know
	exit 1
else
	if [ $2 -lt 201 ]
	then
		if [ $1 = "pi" ]
		then
			num=$(sage -c 'print(pi.n(digits=201))')
			a=2
			digit=$2
			echo $num | cut -b $((digit+a))
		fi

		if [ $1 = "e" ]
		then
			num=$(sage -c 'print(e.n(digits=201))')
			b=2
			digit_new=$2
			echo $num | cut -b $((digit_new+b))
		fi
	else
		echo Give number less than 200
	fi

fi
