#!/bin/bash
set -e

# Check and install required tools
declare -A REQUIRED_TOOLS=( ["wget"]="wget" ["tar"]="tar" ["git"]="git" ["make"]="make" ["pip3"]="python3-pip" ["7z"]="p7zip-full" ["cmake"]="cmake" ["vim"]="vim" ["nano"]="nano")
for tool in "${!REQUIRED_TOOLS[@]}"; do
    if ! command -v $tool >/dev/null 2>&1; then
        echo "$tool is required but it's not installed. Trying to install..."
        if sudo apt-get install -y ${REQUIRED_TOOLS[$tool]}; then
            echo "$tool installation succeeded."
        else
            echo "$tool installation failed. Aborting."
            exit 1
        fi
    fi
done

# Enable SPI
sudo raspi-config nonint do_spi 0 || exit 1
sudo raspi-config nonint do_ssh 0 || exit 1


# Install BCM2835
pushd .
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.71.tar.gz || exit 1
tar zxvf bcm2835-1.71.tar.gz || exit 1
cd bcm2835-1.71/
sudo ./configure || exit 1
sudo make || exit 1
sudo make check || exit 1
sudo make install || exit 1
popd

# Install WiringPi
pushd .
git clone https://github.com/WiringPi/WiringPi || exit 1
cd WiringPi
./build || exit 1
gpio -v || exit 1
popd

# Install the function library
sudo apt-get update || exit 1
sudo apt-get install -y python3-pip python3-pil python3-numpy || exit 1
sudo pip3 install RPi.GPIO spidev || exit 1

# Install Python libraries for LCD HAT
sudo apt-get update || exit 1
sudo apt-get install -y ttf-wqy-zenhei || exit 1

# Install FBCP Driver
sudo apt-get install -y cmake p7zip-full || exit 1
pushd .
wget https://www.waveshare.com/w/upload/f/f9/Waveshare_fbcp.7z || exit 1
7z x Waveshare_fbcp.7z -o./waveshare_fbcp || exit 1
cd waveshare_fbcp
mkdir build
cd build
cmake -DSPI_BUS_CLOCK_DIVISOR=20 -DWAVESHARE_1INCH3_LCD_HAT=ON -DBACKLIGHT_CONTROL=ON -DSTATISTICS=0 .. || exit 1
make -j || exit 1
sudo ./fbcp || exit 1
popd

read -p "SSH & SPI has been enabled, it is recommended to reboot the Pi now. Reboot now? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi
