#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${YELLOW}"
echo "This is an exercise project."
echo "  Anyone is free to use it."
echo "   Respectfully, Kasra."
echo -e "${NC}"


echo -e "${BLUE}Welcome to the NVIDIA Driver Installer${NC}"

PS3="Select your Linux distribution (1-3): "
select distro in "Debian" "Arch" "Ubuntu"; do
    case $distro in
        "Debian")
            echo -e "${YELLOW}Debian selected. Installing NVIDIA driver...${NC}"
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y build-essential dkms linux-headers-$(uname -r)
            sudo apt install -y nvidia-driver
            echo -e "${GREEN}Installation complete. Please reboot your system.${NC}"
            break
            ;;
        "Arch")
            echo -e "${YELLOW}Arch Linux selected. Checking kernel type...${NC}"
            kernel=$(uname -r)

            if [[ $kernel == *lts* ]]; then
                echo -e "${BLUE}LTS kernel detected: $kernel${NC}"
                sudo pacman -Syu --noconfirm
                sudo pacman -S nvidia-lts lib32-nvidia-utils nvidia-settings --noconfirm
            else
                echo -e "${BLUE}Standard kernel detected: $kernel${NC}"
                sudo pacman -Syu --noconfirm
                sudo pacman -S nvidia nvidia-utils nvidia-settings opencl-nvidia --noconfirm
            fi

            sudo modprobe nvidia
            echo -e "${GREEN}Installation complete. Please reboot your system.${NC}"
            break
            ;;
        "Ubuntu")
            echo -e "${YELLOW}Ubuntu selected. Installing NVIDIA driver...${NC}"
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y build-essential dkms linux-headers-$(uname -r)
            sudo apt install -y nvidia-driver-535
            echo -e "${GREEN}Installation complete. Please reboot your system.${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid selection. Please choose between 1 and 3.${NC}"
            ;;
    esac
done
