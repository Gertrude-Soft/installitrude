#!/bin/bash
##
## GERTRUDE PROJECT, 2024
## installitrude
## File description:
## global install
##

set -e

if [ -f /usr/bin/installitrude ] && [ -d /opt/installitrude ]; then
    echo Installitrude is already installed globally.
    exit 1
fi

sudo rm -rf /opt/installitrude

# Create installation directory and copy content
sudo mkdir /opt/installitrude
sudo cp -r ./ /opt/installitrude

# Create binary in /usr/bin/
sudo touch /usr/bin/installitrude
sudo echo -e "#!/bin/sh\n\nsudo /opt/installitrude/installitrude \"\$@\"" > /usr/bin/installitrude
sudo chmod +x /usr/bin/installitrude

if [ -f /usr/bin/installitrude ] && [ -d /opt/installitrude ]; then
    echo -e "\e[32m\e[1mInstallation Successful, you can now use installitrude globally!\e[0m"
else
    echo -e "\e[31m\e[1mInstallation Failed!\e[0m"
fi
