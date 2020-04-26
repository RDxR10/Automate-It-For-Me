for port in {1..6000};
	do (echo >/dev/tcp/192.168.243.135/$port) &>>/dev/null and echo "port $port is open" &
done
