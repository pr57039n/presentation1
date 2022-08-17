#!/bin/bash

# Script section created and managed by Anjuli
# This section echos back selected movies based on user rating

echo "This script will return three movies based on the the rating that you search for. Which movie rating would you like to search for? Please type the number of the corresponding movie rating and then>
echo "1 - R"
echo "2 - PG13"
echo "3 - PG"
echo "4 - U"
read rating;
case $rating in
  1) echo "Three R rated movies are: Billy Elliot, Nueve Reinas, and Blow.";;
  2) echo "Three PG13 rated movies are: I am Sam, The Count of Monte Cristo, and The Others.";;
  3) echo "Three PG rated movies are: Pride & Prejudice, Flipped, and Song of the Sea. ";;
  4) echo "Three U rated movies are Harry Potter and the Sorcerer's Stone, Shrek, and Remember the Titans.";;
  *) echo "This rating is not available. Please enter R, PG13, PG, or U.";; 
esac
