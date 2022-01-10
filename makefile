# Name: Makefile
# Author: Vanderson da Silva dos Santos
# 01/2022

###############################################################################

# Tune the lines below only if you know what you are doing:

# Project specific configurations
include config.mk

BUILD_PATH := $(SRC_DIR)/$(FILE)/build
SKETCH_PATH := $(SRC_DIR)/$(FILE)/$(FILE).ino

#.PHONY: all verify upload info clean help

all: verify upload

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

boards:
	@echo "boards"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli board listall
else
endif

get_config:
	@echo "get config"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli config dump
else
	arduino --get-pref
endif

serial:
	@echo "serial"
ifeq ($(ARDUINO_CLI),TRUE)
	arduino-cli monitor -p $(COM) -c Baudrate=115200 
endif

add_lib:
	@echo "add lib"
	git submodule add --name $(NAME) $(URL) libraries/$(NAME)

clean:
	@echo "clean"
ifeq ($(ARDUINO_CLI),TRUE)
else
endif

help:
	@echo "----------------------- Arduino project Template ------------------------------"
	@echo "           Welcome to the makefile from the Arduino project template"
	@echo "                       Check the the possible commands here"
	@echo 
	@echo  
	@echo "Options:"																	  
	@echo "	 help:       Shows that help"
	@echo "	 setup:      Install esp32 and config arduino ide"
	@echo "	 verify:     Verify your code"
	@echo "	 upload:     Upload your code to the board"
	@echo "	 info:       Shows informations about the boards connected in your computer"
	@echo "	 boards:     Shows boards avaliable to use"
	@echo "	 get_config: Shows the arduino configuration file"
	@echo "	 serial:     Shows serial monitor read"
	@echo "	 clean:      Clean build folder"
	@echo
	@echo "Settings:"
	@echo "	 UPLOAD_SPEED   := "$(UPLOAD_SPEED)
	@echo "	 ARDUINO_CLI    := "$(ARDUINO_CLI)
	@echo "	 COM            := "$(COM)
	@echo "	 MCU            := "$(MCU)
	@echo "	 FQBN           := "$(FQBN)
	@echo "	 FILE           := "$(FILE)
	@echo 