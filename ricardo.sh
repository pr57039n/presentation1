#!/bin/bash

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

