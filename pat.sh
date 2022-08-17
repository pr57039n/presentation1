#!/bin/bash

#Portion created by pat reynolds 8/16/21
#If the user selects to search by year, the output will be based on said year. If invalid input; user is reprompted.
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
