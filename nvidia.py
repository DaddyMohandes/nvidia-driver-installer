import os
import time
import sys
import colorama
from colorama import Fore, Back, Style

colorama.init()

Kernel_NAME = str(os.system("uname -r"))
print(Kernel_NAME)

os.system("clear")     
print(Fore.WHITE + "+++++++++++++++++++++++++++++++++++++++++++")
print(Fore.LIGHTGREEN_EX + "WELCOME LINUX NVIDIA DRIVER INSTALLER TOOL")
print(Fore.WHITE + "++++++++++++++++++++++++++++++++++++++++++++")
print(Fore.WHITE + Style.BRIGHT + "1) Debian , 2) Arch , 3) Ubuntu\n")
distro = int(input(Fore.LIGHTYELLOW_EX + "Enter Number :"))



if(distro == 1):
    os.system("clear")
    sys.stdout.write('\rloading ....')
    time.sleep(0.3)
    os.system("sudo apt update && sudo apt upgrade -y")
    os.system("sudo apt install -y build-essential dkms linux-headers-$(uname -r)")
    os.system("sudo apt install -y nvidia-driver")
    os.system("clear")

elif(distro == 2):
    os.system("clear")
    sys.stdout.write('\rloading ....')
    time.sleep(0.3)
    if "lts" and "LTS" in Kernel_NAME:
        os.system("sudo pacman -syu --noconfirm")
        os.system("sudo pacman -S nvidia-lts lib32-nvidia-utils nvidia-settings --noconfirm")
    else:
        os.system("sudo pacman -Syu --noconfirm")
        os.system("sudo pacman -S nvidia nvidia-utils nvidia-settings opencl-nvidia --noconfirm")
        os.system("sudo modprobe nvidia")
elif(distro == 3):
    os.system("clear")
    sys.stdout.write('\rloading ....')
    time.sleep(0.3)
    os.system("sudo apt update && sudo apt upgrade -y")
    os.system("sudo apt install -y build-essential dkms linux-headers-$(uname -r)")
    os.system("sudo apt install -y nvidia-driver-535")
    os.system("clear")
else:
    os.system("clear")
    sys.stdout.write('\rloading ....')
    time.sleep(0.3)
    os.system("clear")
    print(Back.RED + "Not Found !")

print("Thank for use ")