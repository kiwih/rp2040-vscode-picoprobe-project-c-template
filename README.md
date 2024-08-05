# Pico Tempate with PicoProbe and Optional VSCode

A template project for quick-starting C-based RP2040 Raspberry Pi Pico projects in Visual Studio Code, using the picoprobe programmer.

## Prerequisites

This assumes that 

1. You have already installed OpenOCD with picoprobe, according to the steps in [Getting Started](https://datasheets.raspberrypi.org/pico/getting-started-with-pico.pdf), Appendix A
2. Your VSCode has already been configured according to the steps in [Getting Started](https://datasheets.raspberrypi.org/pico/getting-started-with-pico.pdf), Chapter 7
3. You have installed the picoprobe uf2 to one Pico, and it is connected to the other Pico with the correct wiring (refer again to Appendix A).
4. OR, you bought a [PicoProbe](https://www.raspberrypi.com/products/debug-probe/) - [Amozon Link](https://www.amazon.com/GeeekPi-Raspberry-Connetor-RP2040-Microcontroller/dp/B0C5XNQ7FD)

## Pico SDK installation and references

The easiest is if you are using Ubuntu or Debian Linux (which includes the RPi - Raspberry Pi recommends just using a Pi as your dev box).  Follow these instructions to use a great script to do 99% of the work for you:

[Installation Insructuons](https://learn.arm.com/learning-paths/microcontrollers/rpi_pico/sdk/)

Take special note to get your ENV variables set.  If you don't set them in your .bashrc you can just "source" them in your working terminal.  The "envrc" file in this repo has the variables to be set.  

## Usage
1. Make a project directory in your pico-sdk parent directory (usually `~/pico`, with sdk at `~/pico/pico-sdk`), e.g. make `~/pico/my-project`.
2. Press [Use this template], or, download this template as a zip.
3. Clone your repository/Unzip the downloaded folder to your new project directory.
4. Write whatever you want in main.c, add more files, go wild...
5. Create a "build" directory (mkdir build)
6. Create the makefile (cmake ..)
7. Build! (make or make -JX where X is the number of cores you have)

## Changing the CMake file for your own use

### Print Output over serial

Edit the CMakeLists.txt file to include serial or not.  Set a 1 for incuded, 0 for disabled, in these two lines:

'''
pico_enable_stdio_usb(main 1)
pico_enable_stdio_uart(main 1)
'''

USB is over the power/usb port, and uart is for the uart1 on physical pins 1 and 2.

This template assumes you are using the picoprobe, and you have the picoprobes serial pins attached to pins 1-2-3.  You can then use the uart and choose to either not use the usb port at all or only use it for power.

### Including Anything Interesting

If you use any of the hardware other than serial you are going to have to configure the libraries into CMakeLists.txt.  Add the needed library to this line:

```
target_link_libraries(main
        pico_stdlib
        # other libs as needed
)
```

CMake will include headers as well.

## Building

To build:

```
make build
```

This will delete everything in the build folder, redo the CMake step and build the binary.  It is set up to always build "main" and later flask that binary.

## First Use

The first time you use this you need to "prep" the folder (e.g. make a build directory).  You can do this with:

```
make prep
```

## Flashing the Pico (NEW)
1. The makefile now supports direct flashing of the pico (make flash) - see the script "flash" to see what it does

```
make flash
```



