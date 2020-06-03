#!/bin/bash
DATE=`date +%m%d%y`
SRV=`uname -n`
RPT=./$SRV.HBA.$DATE.txt

exec >> ${RPT} 2>&1

echo " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" 
echo " Hardware Information"
echo " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo " ---------------------------------------------"
echo " OS Version"
echo " ---------------------------------------------"
cat /etc/redhat-release
echo " "
echo " ---------------------------------------------"
echo " System Information"
echo " ---------------------------------------------"
dmidecode -t system
echo " "
echo " "
echo " "
echo " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" 
echo " HBA World Wide Name (WWN)"
echo " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo " "
echo " "
echo " ---------------------------------------------"
echo " HBA Card(FC-Card)"
echo " ---------------------------------------------"
lspci -m | grep -i hba
echo " "
lspci | grep -i "fibre channel"
echo " "
echo " "
echo " ---------------------------------------------"
echo " HBA World Wide Name"
echo " ---------------------------------------------"
systool -c fc_host -v
echo " "
systool -c fc_host -v | grep "Class Device path"
echo " "
systool -c fc_host -v | grep "port_name"
echo " "
echo " "
echo " ---------------------------------------------"
echo " HBA Card PCI Slot"
echo " ---------------------------------------------"
for LIST in `lspci | grep -i "fibre channel" | cut -d "." -f 1 | uniq`; do dmidecode -t slot | grep ${LIST} -B7 && echo "================"; done