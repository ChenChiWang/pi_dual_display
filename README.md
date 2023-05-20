# pi_dual_display

This repository contains configuration files and installation scripts for setting up a Raspberry Pi with various tools and libraries. The setup includes enabling SPI, installing required tools and libraries, and configuring the display resolution.

```bash
chmod +x < the file >
```

1. enabling SPI, installing required tools and libraries and reboot

```bash
sudo ./install_1.3LCD_1.54EPD.sh
```

2. configuring the display resolution

```bash
sudo ./auto_start_LCD.sh
```
3. Reverting configuring the display resolution changes

```bash
sudo ./backtoHDMI.sh
```

## Prerequisites

Before proceeding with the installation, please make sure the following tools are installed on your Raspberry Pi:

```bash
- wget
- tar
- git
- make
- pip3
- 7z
- cmake
- vim
- nano
```
If any of these tools are missing, the installation script will attempt to install them automatically.

## Installation Steps

- Step 0: Make sure the the tools are installed on Raspberry Pi
```bash
- wget
- tar
- git
- make
- pip3
- 7z
- cmake
- vim
- nano
```
- Step 1: Enabling SPI and SSH
- Step 2: Installing BCM2835 (version 1.71)
- Step 3: Installing WiringPi
- Step 4: Installing Required Libraries
- Step 5: Installing LCD HAT Python Library
- Step 6: Installing FBCP Driver
- Step 7: Rebooting the Raspberry Pi

## Auto Start when Power on 1.3" LCD and Set Display Resolution

1. **Setting** The script helps in setting up auto-start, display resolution, and specific modifications for Raspberry Pi 4B.

2. **Reverting** auto-start, display resolution, and specific modifications Changes

