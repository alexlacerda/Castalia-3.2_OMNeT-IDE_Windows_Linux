#!/bin/bash
# *****************************************************************
# *  CASTALIA-3.2 PORT TO OMNeT++ v.4 ON WINDOWS AND LINUX        *
# *  Automatic Installation Shell Script  					      * 
# *  Author(s): Alex Lacerda, Marcella Pinheiro                   *
# *  Contact: help.lares@gmail.com                                *
# *  					                                          * 
# *****************************************************************

# This script automatically checks whether Castalia-3.2 and OMNeT++ v.4 are installed.
# Then applies the patch and copies the files necessary to adapt/port Castalia.

# Showing OMNeT++ and Castalia-3.2 installation reminder
echo 
echo "Make sure OMNeT++ v.4 is correctly installed"
echo "and Castalia-3.2/bin folder is on the PATH"
echo 

# Showing confirmation prompt
read -r -p "Proceed with this installation? [Y/n] " response
if ! [[ $response =~ ^[Yy]$ ]] && ! [ -z $response ]; then 
	echo
	echo "Abort."
	exit 1
fi

# Checking OMNeT++ installation and version
echo
printf "Checking whether omnetpp is on the PATH..."
omnetppPath=`which omnetpp`
if [[ $omnetppPath ]]; then
	echo "OK!"
	omnetppDir=${omnetppPath%/*/*}
	echo "OMNeT++ folder: $omnetppDir"
	printf "Checking OMNeT++ version..."
	versionResult=$(head -n 1 "$omnetppDir/Version" | grep "omnetpp-4")
	if [[ $versionResult ]] ; then
		echo "OK!"
		echo "Version: $versionResult"
	else
		omnetppErrorMessage="OMNeT++ v.4 was not found. Do not forget to install it so that you can run Castalia!"
	fi
else
	omnetppErrorMessage="omnetpp was not found in the PATH. Do not forget to install it so that you can run Castalia!"
fi

echo

# Checking Castalia installation and version
printf "Checking whether Castalia is on the PATH..."
castaliaPath=`which Castalia`
if [[ $castaliaPath ]]; then
	echo "OK!"
	castaliaDir=${castaliaPath%/*/*}
	echo "Castalia folder: $castaliaDir"
	printf "Checking Castalia version..."
	versionResult=$(head -n 1 "$castaliaDir/VERSION" | grep "Castalia 3.0")
	if [[ $versionResult ]] ; then
		echo "OK!"
		echo "Version: $versionResult"
	else
		echo		
		echo "ERROR: Castalia-3.2 not found!"
		echo "Abort."
		echo
		exit 1
	fi
else
	echo
	echo "ERROR: Castalia not found in the PATH!"
	echo "Abort."
	echo
	exit 1
fi

# Applying patch
echo
echo "Applying adaptation patch to Castalia folder..."
patch -d $castaliaDir -p1 < "$(dirname ${BASH_SOURCE[0]})"/castalia_adaptation.patch
if [[ $? != 0 ]]; then
	echo
	echo "ERROR: Unable to apply patch!"
	echo "Maybe it has already been applied before or you do not have a fresh Castalia installation!"
	echo "Abort."
	echo
	exit 1
fi
echo
echo "Patch successfully applied!"

# Copying zlib1.dll (Windows only)
if [[ "$OSTYPE" == "msys" ]]; then
	echo
	echo "Copying zlib1.dll to Castalia folder..."
	cp "$(dirname ${BASH_SOURCE[0]})"/zlib1.dll $castaliaDir
	if [[ $? != 0 ]]; then
		echo
		echo "WARNING: Could not copy zlib1.dll!"
		echo "Try to copy it manually to Castalia-3.2 folder!"
		echo
	fi
fi

# Showing warning message about OMNet++ installation, if any
if [[ $omnetppErrorMessage ]]; then
	echo
	echo "WARNING: $omnetppErrorMessage"
fi

echo
echo "Installation successfully finished!"
echo
echo "Now you can import Castalia.3.2 to OMNeT++ IDE or run a simulation from the command line!"
echo
echo "done."
echo
