#!/bin/bash


echo "Welcome, please enter the lower limit of your range for IMDB Rating (0-10):  "
read lower_limit
echo "Please enter the upper limit of your range for IMDB Rating (0-10): " 
read upper_limit 

if [[ $(echo "$lower_limit > 10" | bc -l) -eq 1 || $(echo "$lower_limit < 0" | bc -l) -eq 1
 || $(echo "$upper_limit > 10" | bc -l) -eq 1 || $(echo "$upper_limit < 0" | bc -l) -eq 1 ]] ;
then
	echo "At least one of your entries is out of the 0-10 range, please rerun the script."
else
	awk -v upper_limit="$upper_limit" -v lower_limit="$lower_limit" -F , '($6 >= lower_limit && $6 <= upper_limit) {print}' Movies.csv
fi

