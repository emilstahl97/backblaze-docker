echo "Starting the virtual display & vnc server"
rm -f /tmp/.X0-lock
Xvfb :0 -screen 0 1024x768x24 & openbox & x11vnc -nopw -q -forever -loop -shared &

function configure_wine {
	unlink $WINEPREFIX/dosdevices/z:
	ln -s /data/ $WINEPREFIX/dosdevices/d:


	if [ ${#COMPUTER_NAME} -gt 15 ]; then 
		echo "Error: computer name cannot be longer than 15 characters"
		exit 1
	fi
	echo "Setting the wine computer name"
	wine reg add "HKCU\\SOFTWARE\\Wine\\Network\\" /v UseDnsComputerName /f /d N
	wine reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\ComputerName\\ComputerName" /v ComputerName /f /d $COMPUTER_NAME
	wine reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\ComputerName\\ActiveComputerName" /v ComputerName /f /d $COMPUTER_NAME
}

cp $WINEPREFIX/drive_c/Program\ Files/Backblaze/bzbui.exe.aside $WINEPREFIX/drive_c/Program\ Files/Backblaze/bzbui.exe
until [ -f $WINEPREFIX/drive_c/Program\ Files/Backblaze/bzbui.exe ]; do
	echo "Backblaze not installed"
	echo "Initializing the wine prefix"
	wine wineboot -i -u
	configure_wine
	echo "Downloading the Backblaze personal installer..."
       	wget https://www.backblaze.com/win32/install_backblaze.exe -P /wine/drive_c/
	echo "Backblaze installer started, please go through the graphical setup in by logging onto the containers vnc server"
       	wine $WINEPREFIX/drive_c/install_backblaze.exe
	echo "Installation finished or aborted, trying to start the Backblaze client..."
	wineserver -k
done


if [ -f $WINEPREFIX/drive_c/Program\ Files/Backblaze/bzbui.exe ]; then
	configure_wine
	echo "Backblaze found, starting the Backblaze client..."
	wine $WINEPREFIX/drive_c/Program\ Files/Backblaze/bzbui.exe -noqiet
fi
