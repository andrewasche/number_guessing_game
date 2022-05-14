#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo "Enter your username:"
read USERNAME
# get available bikes
FOUND_FROM_USER=$($PSQL "SELECT username, played_games, best_game FROM users WHERE username='$USERNAME'; ")
# if username not found
if [[ -z $FOUND_FROM_USER ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO users (username) values('$USERNAME');" )
  if [[ "$INSERT_USERNAME" = "INSERT 0 1" ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    echo "ERROR: couldn't insert into users account"
  fi
else
  echo "$FOUND_FROM_USER" | while read NAME BAR NUMB_GAME BAR NUMBER_STEPS
  do
    echo "Welcome back, $NAME! You have played $NUMB_GAME games, and your best game took $NUMBER_STEPS guesses."
  done
fi

RANDOMNUMB=$(( $RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
read GUESS
COUNT=0
while [[ ! $GUESS =~ ^[0-9]+$ ]] || [ "$RANDOMNUMB" -ne "$GUESS" ]
do
  # if input is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # check bad number
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi
  if [ "$RANDOMNUMB" -lt "$GUESS" ]
  then
    echo "It's lower than that, guess again:"
  fi
  if [ "$RANDOMNUMB" -gt "$GUESS" ]
  then
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  COUNT=$((COUNT+1))
done
COUNT=$((COUNT+1))
echo "You guessed it in $COUNT tries. The secret number was $GUESS. Nice job!"
###  need to calculate stats for users and enter them to the database
## find user
FOUND_INFO=$($PSQL "SELECT username, played_games, best_game FROM users WHERE username='$USERNAME'; ")
echo "$FOUND_INFO" | while read NAME BAR NUMB_GAME BAR NUMBER_STEPS
do
  ## increment games_played
  NUMB_GAME=$((NUMB_GAME+1))
  UPDATE_GAMES=$($PSQL "UPDATE users SET played_games=$NUMB_GAME WHERE username='$USERNAME'; ")

  ## update best game
  if [ $NUMBER_STEPS -lt $COUNT ] || [ $NUMBER_STEPS -lt 1 ]
  then
    UPDATE_BEST=$($PSQL "UPDATE users SET best_game=$COUNT WHERE username='$USERNAME'; ")
  fi
done
