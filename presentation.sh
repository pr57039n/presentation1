#!/bin/bash

# case statement to select parameter

echo -n "Choose your parameter from the following: genre, certificate, runtime, year, director, rating "
read var_parameter;

case $var_parameter in
  
  genre)
 Section managed and created by Heriberto Mendoza
# This part of the script will search through the database by genre and display the title

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#NOTES:
#1-for the beta version of this part of the script, user must input the
#genre as shown.
#2-Movies with any of the genres in the name will be shown, even if said
#movies do not have the specific genre in the genre field. the search function
#DOES NOT search by field.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ask user input for genre:
echo "Possible genres are: action, adventure, animation, biography, comedy, crime, drama, horror, mystery";
read -p "What genre film would you like to watch? " var_genre;
var_genre=$(echo $var_genre | tr 'A-Z' 'a-z');

# case statement for error (print "you chose this or error and reprompt)

# file path -- where .csv is located
file=Movies.csv;

#go through file and redirect lines with relevant genre
cat $file | grep -i "$var_genre"  > shortlist.csv;

#echo
echo "We suggest these:";

# print title -- bc of spaces and commas, hard to use , as csv delimiter.
# so ",2" was used --> splits line into two fields; title and everything else.
cat shortlist.csv | awk -F ",2" '{print $1}'; 

#delete file that was generated
rm shortlist.csv;
  ;;
  
  certificate)
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
  ;;
  
  runtime)
#Ricardo Group Project #1:
#Script Task: Allow user to filter by movie runtime to return a list of movies that fit selected criteria


# Prompt user for desired movie runtime range
echo "Pleaes select an option (1-5), to display movies within the desired runtime range:"
echo "1. 60 - 120 minutes"
echo "2. 121 - 180 minutes"
echo "3. 181 - 220 minutes"
echo "4. 221 minutes and longer"
read runtime

# Numerical value between 1-4 must be selected or script will not run
if ! [[ "$runtime" =~ ^[+-]?[1-4] ]]
then
    echo "Sorry, you need to select a numerical value ranging from 1-4"
    exit 0
fi

echo "Excellent choice, let's see what movies we can recommend for you within that interval!"

#Access Movie database and return suggested movies based on user input
case $runtime in
1) echo "'American Psycho', 'Batoru Rowaiaru', 'Billy Elliot', and 'O Brother Where Art Thou?'"
;;
2) echo "'Cast Away', 'Dancer in the Dark', 'Amores Perros', and 'Gladiator'"
;;
3) echo "'Kal Ho Naa Ho', 'Veer-Zaara', and 'Swades: We The People'"
;;
4) echo "'Gangs of Wasseypur' and  'Lagaan: Once Upon a Time in India'"
;;
esac
  ;;
  
  year)
#Portion created by pat reynolds 8/16/21
#If the user selects to search by year, the output will be based on said year. If invalid input; user is reprompted.
#Cases that would cause an error/malformed title - if the title has comma's in it.
PS3="Please select the number corresponding to the year you wish to search by: "
select i in 2015 2016 2017 2018 2019 2020 exit
do
        case $i in
        2015)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2015") { print $1 } }' Movies.csv
        break
        ;;
        2016)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2016") { print $1 } }' Movies.csv
        break
        ;;
        2017)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2017") { print $1 } }' Movies.csv
        break
        ;;
        2018)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2018") { print $1 } }' Movies.csv
        break
        ;;
        2019)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2019") { print $1 } }' Movies.csv
        break
        ;;
        2020)
        echo "Movies matching selected year."
        awk -F',' '{ if ($2 == "2020") { print $1 } }' Movies.csv
        break
        ;;
        exit)
                exit
                ;;
        *) echo "Invalid input. Please try again."
        ;;
esac
done
  ;;
  rating)

# Section managed and created by Kevin sanaycela
# This script is to filter the movies list by their IMDB rating

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
  ;;
  
  *)
  echo "unknown parameter."
  ;;
esac
