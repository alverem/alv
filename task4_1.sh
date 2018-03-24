#!/bin/bash

touch task4_1.out; chmod u+w task4_1.out
	echo "--- Hardware ---">>task4_1.out
	echo "CPU" `cat /proc/cpuinfo | grep model\ name | uniq`>>task4_1.out

#ram
	echo "RAM" `grep MemTotal /proc/meminfo | awk '{print $2}'`>>task4_1.out
#motherboad
	echo -n "Motherboard: " `dmidecode -t baseboard | grep 'Product Name'; echo "/"; dmidecode -t baseboard | grep 'Manufacturer'`>>task4_1.out 
	
echo -e "\n">>task4_1.out
	
#System Serial Number:

	echo "System Serial Number:" `dmidecode -s system-serial-number`>>task4_1.out 

echo "--- System ---">>task4_1.out

	echo "OS Distribution:" `lsb_release -a | grep Des` >>task4_1.out 
	echo "Kernel version: " `uname -r`>>task4_1.out
#Installation date: xxxx	
	echo "Installation date: "``>>task4_1.out

#Hostname: yyyyy
	echo "Hostname: "`hostname`>>task4_1.out

	echo "Uptime: "`uptime | sed 's/,.*//' | sed 's/.*up //'`>>task4_1.out
	echo "Processes running: "`ps aux | wc -l`>>task4_1.out

	echo "User logged in: "`who | wc -l`>>task4_1.out
#User logged in: 665
	echo "--- Network ---">>task4_1.out

#<Iface #1 name>:  IP/mask


a=`ip  link | grep "state UP" | awk '{print $2}'`
echo -n $a "`ip addr show $a | grep "inet\b" | awk '{print $2}'`">>task4_1.out
echo -e "\n">>task4_1.out








