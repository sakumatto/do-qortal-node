#!/bin/bash
# A script to install Qortal core & UI on your MAC, by Saku Mättö (@sakumatto in Discord)

set -xe

DIR=$(eval echo "~$USER/qortal")
DL=$(eval echo "~$USER/Downloads")
echo "We start off by installing Homebrew (https://brew.sh/)"
echo "Pls be patient and answer any questions"

#On a MAC you need brew installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi
echo "We install a utility called wget"
#Install wget to our MAC
brew install wget

echo "that we use to get the Java bits"
#Install java
brew install --cask adoptopenjdk

#apt update && apt install -yq wget unzip openjdk-14-jre

echo "Working out of your user home directory for our qortal core install. Get Qortal from Github and remove d/l file"
cd ~

wget https://github.com/Qortal/qortal/releases/download/v1.4.1/qortal-1.4.1.zip
unzip qortal-1.4.1.zip
rm -f qortal-1.4.1.zip

echo "and get the new recommended 1.4.1 jar file to replace the original one."
wget https://cloud.crowetic.com/s/BopTqKazPpnxK9q/download -O qortal.jar && rm -f ${DIR}/qortal.jar && mv qortal.jar ${DIR}/qortal.jar

echo "Our qortal core is installed in '$DIR'"
cd $DIR

echo "Make our scripts executable"
echo "In the future when you want to start or stop qortal core go to your coratl directory '$DIR' and run either command as appropriate"
echo "* to start type in command line (ie Terminal.app) ./start.sh <enter> or to stop ./stop.sh <enter>"
chmod +x start.sh
chmod +x stop.sh

echo "As per https://github.com/QORT/qortal/blob/master/src/main/java/org/qortal/settings/Settings.java"
echo "state maxPeers 32 (def 32), hike minOutboundPeers to 20 (16 default), hike minBlockchainPeers to 8 (def 5), hike maxNetworkThreadPoolSize to 45 (def 20), turn on apiDocumentationEnabled (def off)"

echo -en "{\n\"maxPeers\": 32,\n\"minOutboundPeers\": 20,\n\"minBlockchainPeers\": 8,\n\"maxNetworkThreadPoolSize\": 45,\n\"apiDocumentationEnabled\": true\n}\n\"" > settings.json

echo "Grabbing the bootstrap file. Unzip it into db/ and remove d/l file"
wget https://cloud.crowetic.com/s/6rDwKQji3tARNcx/download -O db-crowetic-2.1.2021.zip && unzip db-crowetic-2.1.2021.zip
rm -f db-crowetic-2.1.2021.zip

#echo "Create our qortal user and group"
#groupadd qortal
#useradd -g qortal -d /opt/qortal -s /usr/bin/bash qortal

#echo "Set /opt/qortal to be owned by our qortal user"
#chown -R qortal:qortal /opt/qortal

echo "Starting up qortal!"
/start.sh"
echo "Started (do you see black q in your top bar top of window)"
echo "Pls keep in mind that Qortal UI needs be installed separately and that the UI becomes responsive only after your core has synced 100%."
echo "Do you want to install the UI now? Please respond y if you do, or press <enter> to end this script."
do
	read -s -N 1 -t 1 key
	if [[ $key == $'\x0a' ]];        # if input == ENTER key
		then
		echo "The script will end now."
		exit 0
	fi
done
echo "We will next download the UI .dmg file for you. When it has downloaded, you will need to install it in a normal MAC manner by double clicking the file in your Downloads folder and following the instruction."
wget https://github.com/Qortal/qortal-ui/releases/download/v1.4.1/Qortal-UI-1.4.1.dmg -O $DL/Qortal-UI-1.4.1.dmg
echo "The UI has downloaded and this script will end now."