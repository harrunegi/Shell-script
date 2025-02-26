#!bin/bash

#Check if user is root or not
if [[ "${UID}" -ne 0 ]]
then 
	echo 'Please run with Admin or root user'
	exit 1
fi
#Take Input for Username and Store in variable.
read -p 'Enter the username : ' USER_NAME

#Take the password input.
read -p 'Enter the Password : ' PASSWORD

#Take the Name of the person.
read -p 'Enter the name of the user :' COMMENT

#Create the user.

useradd -c "${COMMENT}" -m "${USER_NAME}"

#Check if user is added or not. We only want to procced with the script if it paassed all the parameters.

if [[ "${?}" -ne 0 ]]
then
	echo 'User is not created, Kindly use the different username.'
	exit 1
fi

#Set the password

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"


if [[ "${?}" -ne 0 ]]
then
	echo 'User is not created, Kindly use the different Password.'
	exit 1
fi

Passwd -e "${USER_NAME}"


#Display the Username
echo "Your Username is ${USER_NAME}"

#Display the password
echo "Your Password is ${PASSWORD}"

#Display the hostname
echo $HOSTNAME
