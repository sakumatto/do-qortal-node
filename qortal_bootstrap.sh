#!/bin/bash

set -xe


#On a MAC you need brew installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

#Install java
brew install --cask adoptopenjdk

#apt update && apt install -yq wget unzip openjdk-14-jre

echo "Working out of /opt for our qortal core install."
pushd /opt

#Install brew on MAC to enable next line
brew install wget
wget https://github.com/Qortal/qortal/releases/download/v1.4.1/qortal-1.4.1.zip
unzip qortal-1.4.1.zip

echo "Our qortal core is installed in '/opt/qortal'"
pushd /opt/qortal

# Make our scripts executable
chmod +x start.sh
chmod +x stop.sh

echo "Edit our settings to ensure we have at least 8 blockchain peers"
cat << EOF > settings.json
{
    "minBlockchainPeers": 8
}
EOF

echo "Grabbing the bootstrap file."
wget https://cloud.crowetic.com/s/6rDwKQji3tARNcx/download && mv download db-crowetic-2.1.2021.zip
unzip db-crowetic-2.1.2021.zip

echo "Create our qortal user and group"
groupadd qortal
useradd -g qortal -d /opt/qortal -s /usr/bin/bash qortal

echo "Set /opt/qortal to be owned by our qortal user"
chown -R qortal:qortal /opt/qortal

echo "Start up qortal!"
su - qortal -c "/opt/qortal/start.sh"