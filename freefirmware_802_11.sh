#!/bin/bash

clear
echo "########################################################################################"
echo "                                                                         ,, ,, ,, ,, ,, "
echo "     '""    '""                                                          !! !! !! !! !! "
echo "   // ||  // ||   ,,,,,     ,,,,,   ,,,,,,,,,, ,,     ,,                 !! !! !! !! !! "
echo "  //  ||//   || ||     || ||     ||     !!     ||     ||                 !! !! !! !! !! "
echo " //   ***    || ||     || ||     ||     !!     ||=====||                 !! !! !! !! !! "
echo "//    !!     || ||=====|| ||=====||     !!     ||     ||################ #  #  #  #  #  "
echo "########################################################################################"
echo "installer version-2019"

PS3='please enter your choice:c'
options=("Install wifi Driver(RTL8-series)" "Install wifi Driver(others)" "Navigates" "quit")
select opt in "${options[@]}"
do
  case $opt in
    "Install wifi Driver(RTL8-series)")
      echo "Reboot Ahead....!!! feel safe."
      apt-get update
      ftp://ftp2.dlink.com/PRODUCTS/DWA-130/REVC/DWA-130_REVC_DRIVERS_0.06_LINUX.ZIP
      unzip DWA-130_REVC_DRIVERS_0.06_LINUX.ZIP
      mkdir /lib/firmware/RTL8192U
      cp rtl8192u_linux_2.6.0006.1031.2008/firmware/RTL8192U/* /lib/firmware/RTL8192U
      reboot
        ;;
      "Install wifi Driver(others)")
          echo "Reboot Ahead....!!! feel safe."
          apt-get update
          apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
          modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
          modprobe wl
          reboot
            ;;
       "Navigates")
            uname -u
            echo "look for linux header version for option 2"
            lspci | grep -i network
            echo "go for 1 if its realtek"
               ;;
       "Quit")
            break
              ;;
         *) echo invalid option;;
   esac
done
   

      
