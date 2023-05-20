# pi_dual_display

This repository contains configuration files and installation scripts for setting up a Raspberry Pi with various tools and libraries. The setup includes enabling SPI, installing required tools and libraries, and configuring the display resolution.

```bash
chmod +x <the file>
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

## GPIO setting for dual display

#### 1.54-inch e-Paper Display GPIO

| e-Paper | Raspberry Pi BCM | Raspberry Pi Physical Pin |
|---------|------------------|---------------------------|
| VCC     | 3.3V             | 1 or 17                   |
| GND     | GND              | 6, 9, 14, 20, 25, 30, 34 or 39 |
| DIN     | MOSI             | 19                        |
| CLK     | SCLK             | 23                        |
| CS      | 7                | 26                        |
| DC      | 25               | 22                        |
| RST     | 17               | 11                        |
| BUSY    | 22               | 15                        |


#### 1.3-inch SPI Display GPIO

| PIN           | Raspberry Pi BCM | Raspberry Pi Physical Pin | Description                        |
|---------------|------------------|---------------------------|------------------------------------|
| KEY1          | 21               | 40                        | KEY1GPIO                           |
| KEY2          | 20               | 38                        | KEY2GPIO                           |
| KEY3          | 16               | 36                        | KEY3GPIO                           |
| Joystick UP   | 6                | 31                        | Upward direction of the Joystick   |
| Joystick Down | 19               | 35                        | Downward direction of the Joystick |
| Joystick Left | 5                | 29                        | Left direction of the Joystick     |
| Joystick Right| 26               | 37                        | Right direction of the Joystick    |
| Joystick Press| 13               | 33                        | Press the Joystick                 |
| SCLK          | 11               | 23                        | SPI clock line                     |
| MOSI          | 10               | 19                        | SPI data line                      |
| CS            | 8                | 24                        | Chip selection                     |
| DC            | 25               | 22                        | Data/Command control               |
| RST           | 27               | 13                        | Reset                              |
| BL            | 24               | 18                        | Backlight                          |