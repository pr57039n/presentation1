#!/bin/bash

# case statement to select parameter

echo -n "Choose your parameter from the following: genre, certificate, runtime, year, director, rating "
read var_parameter;

case $var_parameter in
  
  genre)
  #code for genre
  ;;
  
  certificate)
  #code for certificate
  ;;
  
  runtime)
  #code for runtime
  ;;
  
  year)
  #code for year
  ;;
  
  rating)
  #code for rating
  ;;
  
  *)
  echo "unknown parameter."
  ;;
esac
