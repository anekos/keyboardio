#!/bin/bash

set -euC

ln -s /usr/share/arduino /usr/local/arduino
cd /usr/share/arduino/hardware
ln -s archlinux-arduino arduino
ln -s archlinux-arduino tools
mkdir -p /usr/share/arduino/tools/avr/bin
ln -s /usr/bin/avrdude /usr/share/arduino/tools/avr/bin/
mkdir -p /usr/share/arduino/tools/avr/etc
ln -s /usr/share/arduino/hardware/archlinux-arduino/avr/bootloaders/gemma/avrdude.conf /usr/share/arduino/tools/avr/etc/

