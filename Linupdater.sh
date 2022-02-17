#! /bin/bash


#########################################
#     Script to update your Linux OS    #
#########################################


######################################### finding the package manager #########################################

figlet "Hello $(whoami) Let's update your system"

echo "[*] Checking for the supported package type............."

declare -A packinfo;

packinfo[/etc/redhat-release]=yum
packinfo[/etc/arch-release]=pacman
packinfo[/etc/gentoo-release]=emerge
packinfo[/etc/SuSE-release]=zypp
packinfo[/etc/debian_version]=apt


for f in ${!packinfo[@]}
do
    
    if [[ -f $f ]];then
        
        package=${packinfo[$f]}
        
    fi
    
done

################################################ Permorming update ##############################################

if [ "$package" == "apt" ]

then
    
    sudo apt-get update && sudo apt-get -y upgrade
    
elif [ "$package" == "dnf" ]

then
    
    sudo dnf upgrade
    
elif [ "$package" == "zypper" ]

then
    
    sudo zypper -n update && sudo zypper -n dup
    
elif [ "$package" == "pacman" ]

then
    
    sudo pacman -Syyu
    
else
    
    echo "Some error occured !"
    
fi

clear

figlet "Complete!"

################################################ End of script ##################################################
