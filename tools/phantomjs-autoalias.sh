#!/usr/bin/env bash
#
#    Make "phantomjs" call the correct phantomjs binary through all your alias files.
#    
#####################################################################################

# Use the script by passing the path to the binary as an option to the script.
# $ ./phantomjs-autoalias.sh /usr/local/src/phantom/bin/phantomjs
phantompath="$1"

# Set variables for the alias formats.

aliasbash="alias phantomjs=\"$phantompath\""
aliasc="alias phantomjs $phantompath"
aliasz="alias phantomjs='$phantompath'"
aliask="alias phantomjs=$phantompath"

# Option to clean up alias files.
# Use this option like:
#
# $ ./phantomjs-autoalias.sh /path/to/your/binary cleanup

if [ $2 = cleanup ]; then
sed "/^alias phantomjs/d" ~/.bashrc > phantom.tmp &&
cp phantom.tmp ~/.bashrc 2> /dev/null &&
rm phantom.tmp
sed "/^alias phantomjs/d" ~/.bash_profile > phantom.tmp &&
cp phantom.tmp ~/.bash_profile 2> /dev/null &&
rm phantom.tmp
sed "/^alias phantomjs/d" ~/.cshrc > phantom.tmp &&
cp phantom.tmp ~/.cshrc 2> /dev/null &&
rm phantom.tmp
sed "/^alias phantomjs/d" ~/.kshrc > phantom.tmp &&
cp phantom.tmp ~/.kshrc 2> /dev/null &&
rm phantom.tmp
sed "/^alias phantomjs/d" ~/.zprofile > phantom.tmp &&
cp phantom.tmp ~/.zprofile 2> /dev/null &&
rm phantom.tmp
else
echo "No cleanup...."
fi


# Write out to all alias files that we can.

echo "Adding the alias phantomjs to all available rc files..."
ls -l /home/$USER/.bashrc /home/$USER/.bash_profile /home/$USER/.zprofile /home/$USER/.cshrc /home/$USER/.kshrc

if [ -s  /home/$USER/.bash_profile ]; then
echo "$aliasbash" >> /home/$USER/.bash_profile
else
echo "Not updating a .bash_profile"
fi

if [ -s  /home/$USER/.bashrc ]; then
echo "$aliasbash" >> /home/$USER/.bashrc
else
echo "Not updating a .bashrc"
fi

if [ -s  /home/$USER/.zprofile ]; then
echo "$aliasz" >> /home/$USER/.zprofile
else
echo "Not updating a .zprofile"
fi

if [ -s  /home/$USER/.kshrc ]; then
echo "aliask" >> /home/$USER/.kshrc
else
echo "Not updating a .kshrc" 
fi
if [ -s  /home/$USER/.cshrc ]; then
echo "aliasc" >> /home/$USER/.cshrc
else
echo "Not updating a .cshrc"
fi
if [ -z $1 ]; then
echo "usage: ./phantomjs-autoalias.sh /path/to/your/phantomjs/binary"
else
echo "Complete."
fi
