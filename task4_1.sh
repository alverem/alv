#!/bin/bash

touch task4_1.out; chmod 755 task4_1.out
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

	echo "Installation date: " `ls -clt / | tail -n 1 | awk '{ print $7, $6, $8 }'`>>task4_1.out

	echo "Hostname: "`hostname`>>task4_1.out

	echo "Uptime: "`uptime | sed 's/,.*//' | sed 's/.*up //'`>>task4_1.out

	echo "Processes running: "`ps aux | wc -l`>>task4_1.out

	echo "User logged in: "`who | wc -l`>>task4_1.out

	echo "--- Network ---">>task4_1.out

ip -o -f inet addr show | awk '{print $1" iface "$2 " : "  $4}'>>task4_1.out
