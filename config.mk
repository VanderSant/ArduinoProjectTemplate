# Name: config.mk
# Author: Vanderson Santos
# 01/2022

# Cube file name without .ioc extension
PROJECT_NAME = arduino_project_template
VERSION := 1

TARGET_BOARD := target_$(PROJECT_NAME)_$(VERSION)

# Lib dir
LIB_DIR  := libraries

# Lib dir
SRC_DIR := src

# Tests Directory
TEST_DIR := tests

# Baud rate.
UPLOAD_SPEED = 57600

# Programmer protocol.
UPLOAD_PROTOCOL = arduino

# CPU Speed in hz.
CPU_FREQ = 16000000L

# Board type and config.
MCU = ARDUINO_UNO
FQBN = arduino:avr:uno

# Default values, can be set on the command line or here
ARDUINO_CLI ?= TRUE
COM 	?= COM6
FILE	?= serial_sender
DEBUG   ?= 1
VERBOSE ?= 0
TEST    ?= 0