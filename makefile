# Name: Makefile
# Author: Vanderson da Silva dos Santos
# Zima hospital automation team
# 01/2022

###############################################################################

# Tune the lines below only if you know what you are doing:

# Project specific configurations
include config.mk

BUILD_PATH := $(SRC_DIR)/$(FILE)/build
SKETCH_PATH := $(SRC_DIR)/$(FILE)/$(FILE).ino

#.PHONY: all verify upload info clean help

all: verify

setup:
	@echo "setup"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli core install arduino:avr
	arduino-cli config init --overwrite --additional-urls https://dl.espressif.com/dl/package_esp32_index.json
	arduino-cli config set directories.user $(shell pwd)
	arduino-cli core update-index
	arduino-cli core install esp32:esp32
else
	arduino --pref sketchbook.path= --save-prefs
endif
	
verify:
	@echo "verify"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli compile --fqbn $(FQBN) $(SKETCH_PATH)
else
	arduino --verify $(SKETCH_PATH)
endif

upload:
	@echo "upload"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli upload -p $(COM) --fqbn $(FQBN) $(SKETCH_PATH)
else
	arduino --upload $(SKETCH_PATH)
endif

info:
	@echo "info"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli board list
else
endif

clean:
	@echo "clean"
ifeq ($(ARDUINO_CLI),TRUE)
else
endif

board_avaliable:
	@echo "board list"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli board listall
else
endif

help:
	@echo "help"
ifeq ($(ARDUINO_CLI),TRUE)
else
endif

get_config:
	@echo "help"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli config dump
else
	arduino --get-pref
endif
