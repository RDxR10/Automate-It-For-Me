date
echo "The path of your file is......." 
find / -name "$1" 2>/dev/null
echo "-----------------------------------------------------------------------------------------"
echo -e "Enter your choice \n"
echo -e "1) Quick Login Summary \n2) Last Logins \n3) Disk and Memory Usage \n4) Unused RAM Memory \n5) Memory Utilization \n6) Current Connections \n7) Open ports \n8) Your IP Address,IPs on your LAN, Gateway \n9) Current Processes \n10) Virtual Machine Statistics \n0) Exit\n\n \c"
#read choice
while read choice
 do
	case "$choice" in
	1)echo "[+]Currently connected to :" 
		w ;;
	2)echo "[+]Last logins :" 
		last -a | head -3 ;;
	3)echo "[+]Disk and Memory usage: " 
		df -h | xargs | awk '{print "Free/total disk: " $11 "/ " $9}' 
		free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}' ;;
	4)echo "[+]Unused RAM Memory: " 
		free | grep Mem | awk '{ print $4 }' ;;
	5)echo "[+]Utilization and the most expensive processes: " 
		top -b |head -3  
		top -b |head -10|tail -4;;
	6)echo "[+]Current connections: " 
		ss -s;;
	7)echo "[+]Open ports are listed below :" 
		netstat -nutl ${1} | grep : | awk '{print $4}' | awk -F':' '{print $NF}' ;;
	8)echo "[+]Your IP Address is :" 
		hostname -I
	  echo "[+]IP Addresses on your LAN are.... :" 
		arp -n 
	  echo "[+]Your gateway is....  :" 
		ip route | grep default | awk '{ print $3 }' ;;
	9)echo "[+]Current processes : " 
		ps auxf --width=200;;
	10)echo "[+]VMstat: " 
		vmstat 1 5;;
	0)exit
	esac
	#echo -e "Do you still want to continue (y/n)?: \c"
	#read ans
done
