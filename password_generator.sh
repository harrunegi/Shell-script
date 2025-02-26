#!/bin/bash

#This script generates a list of random passwords.

#A random number as a password.
PASSWORD="${RANDOM}"
echo " ${PASSWORD}"

#Three random number as a password.
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

#Generating random password using date.

PASSWORD=$(date +%s)
echo "${PASSWORD}"

#Use nano sec to generate the password

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#A better password.

PASSWORD=$(date +%s%N | sha256sum | head -c32)

echo "${PASSWORD}"

#Even better password

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

#Lets use the special character also

SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -1)
echo "${SPECIAL_CHARACTER}${PASSWORD}"
