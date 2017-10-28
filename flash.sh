#!/bin/bash

set -x
set -euC

ln -s "$PWD/Arduino" ~/Arduino

trap clean EXIT

function clean {
  popd
  unlink ~/Arduino
  mv backup.ino Model01-Firmware/Model01-Firmware.ino
}

cp Model01-Firmware/Model01-Firmware.ino backup.ino
cp my.ino Model01-Firmware/Model01-Firmware.ino

pushd Model01-Firmware

make ARDUINO_BUILDER_PATH="/usr/bin/arduino-builder" \
     ARDUINO_PATH="/usr/share/arduino" \
     ARDUINO_LOCAL_LIB_PATH=../Arduino \
     AVR_GCC_PREFIX="/usr" \
     ARDUINO_TOOLS_PATH="/usr/share/arduino/tools" \
     AVR_SIZE_PATH="/usr/bin/avr-size" \
     flash
