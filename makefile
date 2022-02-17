# Name: Makefile
# Author: Vanderson da Silva dos Santos
# 01/2022
###############################################################################

# Tune the lines below only if you know what you are doing:

# Project specific configurations
include config.mk

BUILD_PATH := $(SRC_DIR)/$(FILE)/build
C_SOURCES  := $(shell find $(LIB_DIR) -name "*.cpp")
C_HEADERS  := $(shell find $(LIB_DIR) -name "*.hpp")
C_INO      := $(shell find $(TEST_DIR) -name "*.ino")
C_MAINS    := $(shell find $(SRC_DIR) -name "*.ino")

BUILD_FOLDERS := $(shell find -name "build" )

ifeq ($(TEST),1)
	SKETCH_PATH := $(TEST_DIR)/$(FILE)/$(FILE).ino
else
	SKETCH_PATH := $(SRC_DIR)/$(FILE)/$(FILE).ino
endif

all: verify upload

setup:
	@echo "setup"
	arduino-cli core install arduino:avr
	arduino-cli config init --overwrite --additional-urls https://dl.espressif.com/dl/package_esp32_index.json
	arduino-cli config set directories.user $(shell pwd)
	arduino-cli config set sketch.always_export_binaries true
	arduino-cli core update-index
	arduino-cli core install esp32:esp32
	
verify:
	@echo "verify"
	arduino-cli compile --fqbn $(FQBN) $(SKETCH_PATH)

upload:
	@echo "upload"
	arduino-cli upload -p $(COM) --fqbn $(FQBN) $(SKETCH_PATH)

info:
	@echo "info"
	arduino-cli board list

boards:
	@echo "boards"
	arduino-cli board listall

get_config:
	@echo "get config"
	arduino-cli config dump

serial:
	@echo "serial"
	arduino-cli monitor -p $(COM) -c Baudrate=$(BAUDRATE) 

add_lib:
	@echo "add lib"
	git submodule add --name $(NAME) $(URL) libraries/$(NAME)

clean:
	@echo "clean"
	rm -rf $(BUILD_FOLDERS)

# Format source code using uncrustify
format:
	@echo "format"
	uncrustify -c uncrustify.cfg --replace --no-backup $(C_SOURCES) $(C_HEADERS) $(C_INO) $(C_MAINS)	

help:
	@echo "----------------------- Arduino Project Template ------------------------------"
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
	@echo "	 format:     Format code using uncrustify"
	@echo "	 add_lib:    Add library - Need to log in github account"
	@echo "	 clean:      Clean build folder"
	@echo "	 help:       Print this tutorial"
	@echo
	@echo "Settings:"
	@echo "	 UPLOAD_SPEED   := "$(UPLOAD_SPEED)
	@echo "	 COM            := "$(COM)
	@echo "	 BAUDRATE       := "$(BAUDRATE)
	@echo "	 FQBN           := "$(FQBN)
	@echo "	 FILE           := "$(FILE)
	@echo 

.PHONY: setup verify upload info boards get_config serial add_lib clean format help