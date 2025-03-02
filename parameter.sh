#!/bin/bash
#This script generates a random password for each user specified on the command line.

#Display what the user typed on the command line.

echo "You excuted this command: ${0}"

#Display the path and file name of the script.

echo "You Used $(dirname ${0}) as the path to the $(basename ${0}) script."

#Tell them how many arguments they passed in.

#Inside the script they are parameters, outside they are arguments.
NUMBER_OF_PARAMETER="${#}"

echo "you supplied the ${NUMBER_OF_PARAMETER} arguments"

#Make sure they at least supply one argument.

if [[ "${NUMBER_OF_PARAMETER}" -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
else
	echo "Thanks for providing the username"
fi

#Generate and Display a password for each parameter.

for USER_NAME in "${@}"
do
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "${USER_NAME}: ${PASSWORD}"
done

