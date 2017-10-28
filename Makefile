
.PHONY: flash setup update

flash:
	./flash.sh

update:
	git submodule update --init --recursive

setup: update
	sudo pacman -S arduino arduino-avr-core
	sudo ./setup.sh
