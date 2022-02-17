# Arduino Project Template

> Basic Arduino and Arduino-cli project template with Makefile

## Index<!-- omit in toc -->
- [Ideia](#%F0%9F%9A%80-ideia)
- [Dependencies](#%F0%9F%93%A6-dependencies)
    - [Windows](#arduino-cli---windows)
    - [Linux/WSL](#arduino-cli---linuxwsl)
- [How to Use](#%F0%9F%92%A5-how-to-use)

## 🚀 Ideia 
Hey everyone, sometimes i need to program some arduino or esp32, but I realy don't like the arduino IDE or the Arduino extension from vscode, because of that I'm trying to create a simple makefile to install esp32, check my codes, with all my libries, of course, and upload the bin file into the microcontroler.
To do that, i'm using the classical arduino program and the amazing arduino-cli, which is better in many ways.

## 📦 Dependencies
The only requisition of the project template today is the arduino cli. 
### Arduino-Cli - Windows

I'll describe how to install, but, if you prefer, the arduino has an official tutorial to teach how to install arduino-cli in your Windows. To watch the video [click here](https://youtu.be/1jMWsFER-Bc)

1. Download the program from [arduino site](https://arduino.github.io/arduino-cli/dev/installation/)
2. Extract the downloaded program to the folder of your choise and copy the path of the .exe (.exe file should be inside of the folder).
3. Add the .exe path in the environment variables of the Windows.

To verify if it's everything ok, paste this in your terminal:

```bash
arduino-cli
```

Your terminal should print that:

```bash
Usage:
  arduino-cli [command]

Examples:
  C:\Users\Vanderson\Documents\downloads\extensão\arduino-cli_0.20.2_Windows_64bit\arduino-cli.exe <command> [flags...]

Available Commands:
  board           Arduino board commands.
  burn-bootloader Upload the bootloader.
  cache           Arduino cache commands.
  compile         Compiles Arduino sketches.
  completion      Generates completion scripts
  config          Arduino configuration commands.
  core            Arduino core operations.
  daemon          Run as a daemon on port: 50051
  debug           Debug Arduino sketches.
  help            Help about any command
  lib             Arduino commands about libraries.
  monitor         Open a communication port with a board.
  outdated        Lists cores and libraries that can be upgraded
  sketch          Arduino CLI sketch commands.
  update          Updates the index of cores and libraries
  upgrade         Upgrades installed cores and libraries.
  upload          Upload Arduino sketches.
  version         Shows version number of Arduino CLI.

Flags:
      --additional-urls strings   Comma-separated list of additional URLs for the Boards Manager.
      --config-file string        The custom config file (if not specified the default will be used).
      --format string             The output format for the logs, can be: text, json, jsonmini (default "text")
  -h, --help                      help for arduino-cli
      --log-file string           Path to the file where logs will be written.
      --log-format string         The output format for the logs, can be: text, json
      --log-level string          Messages with this level and above will be logged. Valid levels are: trace, debug, info, warn, error, fatal, panic
      --no-color                  Disable colored output.
  -v, --verbose                   Print the logs on the standard output.

Use "arduino-cli [command] --help" para mais informações sobre um comando.

```

### Arduino-Cli - Linux/WSL

Only paste theses commands in your terminal to install:

```
cd ~
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
```

To verify if it's everything ok, paste this in your terminal:

```bash
arduino-cli
```

Your terminal should print that:

```bash
Usage:
  arduino-cli [command]

Examples:
  C:\Users\Vanderson\Documents\downloads\extensão\arduino-cli_0.20.2_Windows_64bit\arduino-cli.exe <command> [flags...]

Available Commands:
  board           Arduino board commands.
  burn-bootloader Upload the bootloader.
  cache           Arduino cache commands.
  compile         Compiles Arduino sketches.
  completion      Generates completion scripts
  config          Arduino configuration commands.
  core            Arduino core operations.
  daemon          Run as a daemon on port: 50051
  debug           Debug Arduino sketches.
  help            Help about any command
  lib             Arduino commands about libraries.
  monitor         Open a communication port with a board.
  outdated        Lists cores and libraries that can be upgraded
  sketch          Arduino CLI sketch commands.
  update          Updates the index of cores and libraries
  upgrade         Upgrades installed cores and libraries.
  upload          Upload Arduino sketches.
  version         Shows version number of Arduino CLI.

Flags:
      --additional-urls strings   Comma-separated list of additional URLs for the Boards Manager.
      --config-file string        The custom config file (if not specified the default will be used).
      --format string             The output format for the logs, can be: text, json, jsonmini (default "text")
  -h, --help                      help for arduino-cli
      --log-file string           Path to the file where logs will be written.
      --log-format string         The output format for the logs, can be: text, json
      --log-level string          Messages with this level and above will be logged. Valid levels are: trace, debug, info, warn, error, fatal, panic
      --no-color                  Disable colored output.
  -v, --verbose                   Print the logs on the standard output.

Use "arduino-cli [command] --help" para mais informações sobre um comando.

```

## 💥 How To Use

- To verify and upload code in folder src to your board:
```bash
make FILE=file_name
```
Exemple:
```bash
make FILE=serial_sender
```

- To verify code in folder src to your board:
```bash
make verify FILE=file_name
```
Exemple:
```bash
make verify FILE=serial_sender
```

- To initilize serial read
```bash
make serial BAUDRATE=9600
```

- In general, this makefile can do a plenty of different commands, to check all the options try this command:
```bash
make help
```
This command must print something like this:
```bash
----------------------- Arduino Project Template ------------------------------
           Welcome to the makefile from the Arduino project template
                       Check the the possible commands here


Options:
         help:       Shows that help
         setup:      Install esp32 and config arduino ide
         verify:     Verify your code
         upload:     Upload your code to the board
         info:       Shows informations about the boards connected in your computer
         boards:     Shows boards avaliable to use
         get_config: Shows the arduino configuration file
         serial:     Shows serial monitor read
         format:     Format code using uncrustify
         add_lib:    Add library - Need to log in github account
         clean:      Clean build folder
         help:       Print this tutorial

Settings:
         UPLOAD_SPEED   := 57600
         COM            := COM7
         BAUDRATE       := 9600
         FQBN           := arduino:avr:uno
         FILE           := serial_sender
```
