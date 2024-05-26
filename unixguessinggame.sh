#!/usr/bin/sh

scorefile="highscores_sh"
guess=-1
num=0

echo "guess.sh - Please guess a number between 1 and 100\n"

### Generating a random number

answer=`perl -e 'print (sprintf("%.0f",rand(99)) + 1);'`

### Playing the game
while [ $guess -ne $answer ]; do
	num=`expr $num + 1`
	echo "Enter guess $num: \c"
	read guess
	if [ $guess -lt $answer ]; then
		echo "Higher..."
	elif [ $guess -gt $answer ]; then
		echo "Lower..."
	fi
done
echo "Your guess is right. It took $num guesses.\n"

### Saving your high score
echo "Please enter your name: \c"
read name
echo $name $num >> $scorefile

### Printing the high scores
echo "\nPrevious high scores,"
cat $scorefile
