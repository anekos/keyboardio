#!/bin/bash

set -x
set -euC

cd Model01-Firmware

ln -s "$PWD/../Arduino" ~/Arduino

trap clean EXIT

function clean {
  unlink ~/Arduino
}

make ARDUINO_BUILDER_PATH="/usr/bin/arduino-builder" \
     ARDUINO_PATH="/usr/share/arduino" \
     ARDUINO_LOCAL_LIB_PATH=../Arduino \
     AVR_GCC_PREFIX="/usr" \
     ARDUINO_TOOLS_PATH="/usr/share/arduino/tools" \
     AVR_SIZE_PATH="/usr/bin/avr-size" \
     flash
