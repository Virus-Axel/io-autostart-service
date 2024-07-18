# If any of these environment variables are empty.
if [ [ -z "${IO_DEVICE_ID}" ] || [ -z ${IO_USER_ID} ] || [ -z ${IO_DEVICE_NAME} ] || [ -z ${IO_AUTH_TOKEN} ] ]; then
	echo 'Make sure variables are set'
else
	curl -L https://github.com/ionet-official/io-net-official-setup-script/raw/main/ionet-setup.sh -o ionet-setup.sh
	chmod +x ionet-setup.sh && ./ionet-setup.sh
	curl -L https://github.com/ionet-official/io_launch_binaries/raw/main/io_net_launch_binary_linux -o io_net_launch_binary_linux
	chmod +x io_net_launch_binary_linux
	./io_net_launch_binary_linux --device_id=${IO_DEVICE_ID} --user_id=${IO_USER_ID} --operating_system="Linux" --usegpus=true --device_name="${IO_DEVICE_NAME}" --token=${IO_AUTH_TOKEN}
	
	while [ true ]; do
		while [ `docker ps | grep -q io-worker-monitor; echo $?` == 0 ]; do
			sleep 10
		done
		./io_net_launch_binary_linux --device_id=${IO_DEVICE_ID} --user_id=${IO_USER_ID} --operating_system="Linux" --usegpus=true --device_name="${IO_DEVICE_NAME}" --token=${IO_AUTH_TOKEN}
		
		sleep 10
	done
fi
