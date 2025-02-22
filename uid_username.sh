#!/bin/bash

#This script will display the UID and Username of the user excuting this script.
#Also if the user is the root user or not.

echo "Your UID is ${UID} euid ${EUID}"

USER_NAME=$(id -un)

echo "Your username is ${USER_NAME}"

#Display if user is a root user or not.


if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root.'
else
	echo 'You are not root.'
fi



