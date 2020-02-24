#!/bin/sh

echo "begin"
echo "Running Generating Password"

########### read data ############
read -p "> Password length? " passwordLength
read -p "> Include uppercase letters? (y/n) " uppercaseLetters
read -p "> Include lowercase letters? (y/n) " lowercaseLetters
read -p "> Include numbers? (y/n) " includeNumbers
read -p "> Include symbols? (y/n) " includeSymbols

########## variables ##############
number=""
pattern=''

########## conditions ############
echo "Generating new random password"

if [ "$uppercaseLetters" = "y" ]; then
    pattern=$pattern'A-Z'
fi

if [ "$lowercaseLetters" = "y" ]; then
    pattern=$pattern'a-z'
fi

if [ "$includeNumbers" = "y" ]; then
    pattern=$pattern'0-9'
fi

if [ "$includeSymbols" = "y" ]; then
    pattern=$pattern'(!@#$%&*+-/)'
fi

number=$(cat /dev/urandom | tr -dc $pattern  | fold -w $passwordLength | head -n 1)

echo $number
echo "end"