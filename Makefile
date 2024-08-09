##
## GERTRUDE PROJECT, 2024
## installitrude
## File description:
## Makefile
##

all: install

install:
	sudo ./global_install.sh

uninstall:
	sudo ./uninstall.sh

reinstall:
	sudo ./uninstall.sh
	sudo ./global_install.sh
