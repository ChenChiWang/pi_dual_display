#!/bin/bash

# Current user's home directory
HOME_DIR="/home/${SUDO_USER}"

# Backup original files
sudo cp /etc/rc.local /etc/rc.local.bak
sudo cp /boot/config.txt /boot/config.txt.bak

# Auto-start when Power on
sudo cp $HOME_DIR/waveshare_fbcp/build/fbcp /usr/local/bin/fbcp
sudo sed -i 's/^exit 0/fbcp\&\nexit 0/' /etc/rc.local

# Set the Display Resolution
echo "hdmi_force_hotplug=1
hdmi_cvt=300 300 60 1 0 0 0
hdmi_group=2
hdmi_mode=87
display_rotate=0" | sudo tee -a /boot/config.txt

# # Comment out lines in [pi4] part for Raspberry Pi 4B
# if grep -q "Raspberry Pi 4" /proc/device-tree/model
# then
#     sudo sed -i 's/^\s*dtoverlay=vc4-kms-v3d/#dtoverlay=vc4-kms-v3d/' /boot/config.txt
#     sudo sed -i 's/^\s*max_framebuffers=2/#max_framebuffers=2/' /boot/config.txt
# fi

sudo sed -i 's/^\s*dtoverlay=vc4-kms-v3d/#dtoverlay=vc4-kms-v3d/' /boot/config.txt
sudo sed -i 's/^\s*max_framebuffers=2/#max_framebuffers=2/' /boot/config.txt

