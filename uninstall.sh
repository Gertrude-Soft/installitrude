#!/bin/bash
##
## GERTRUDE PROJECT, 2024
## installitrude
## File description:
## uninstall
##

set -e

if [ ! -f /usr/bin/installitrude ] || [ ! -d /opt/installitrude ]; then
    echo Installitrude is not installed globally.
    exit 1
fi

sudo rm -rf /opt/installitrude
sudo rm /usr/bin/installitrude

if [ -f /usr/bin/installitrude ] && [ -d /opt/installitrude ]; then
    echo -e "\e[31m\e[1mUninstallation Failed!\e[0m"
else
    echo -e "\e[32m\e[1mUninstallation Successful!\e[0m"
fi
