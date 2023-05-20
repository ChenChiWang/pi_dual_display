#!/bin/bash

# 檢查並安裝所需工具
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

# 啟用 SPI
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_ssh 0


# 安裝 BCM2835（只安裝版本 1.71）
pushd .
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.71.tar.gz
tar zxvf bcm2835-1.71.tar.gz
cd bcm2835-1.71/
sudo ./configure
sudo make
sudo make check
sudo make install
popd

# 安裝 WiringPi
pushd .
git clone https://github.com/WiringPi/WiringPi
cd WiringPi
./build
gpio -v
popd

# 安裝功能庫
sudo apt-get update
sudo apt-get install -y python3-pip python3-pil python3-numpy
sudo pip3 install RPi.GPIO spidev

# 安裝 LCD HAT 的 Python 庫
sudo apt-get update
sudo apt-get install -y ttf-wqy-zenhei

# 安裝 FBCP 驅動器
sudo apt-get install -y cmake p7zip-full
pushd .
wget https://www.waveshare.com/w/upload/f/f9/Waveshare_fbcp.7z
7z x Waveshare_fbcp.7z -o./waveshare_fbcp
cd waveshare_fbcp
mkdir build
cd build
cmake -DSPI_BUS_CLOCK_DIVISOR=20 -DWAVESHARE_1INCH3_LCD_HAT=ON -DBACKLIGHT_CONTROL=ON -DSTATISTICS=0 ..
make -j
sudo ./fbcp
popd

read -p "SSH & SPI has been enabled, it is recommended to reboot the Pi now. Reboot now? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi

