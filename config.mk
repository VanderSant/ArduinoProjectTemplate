# Name: config.mk
# Author: Vanderson Santos
# 01/2022
###############################################################################

# Lib dir
LIB_DIR  := libraries

# Lib dir
SRC_DIR := src

# Tests Directory
TEST_DIR := tests

# Baud rate.
UPLOAD_SPEED = 57600

# Default Board type and config.
FQBN ?= arduino:avr:uno

# Default values, can be set on the command line or here
ARDUINO_CLI ?= TRUE
COM 	    ?= COM7
BAUDRATE    ?= 9600
FILE	    ?= serial_sender
TEST        ?= 0