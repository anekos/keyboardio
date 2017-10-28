
.PHONY: update

flash:
	./flash.sh

setup:
	sudo pacman -S arduino arduino-avr-core
	sudo ./setup.sh
