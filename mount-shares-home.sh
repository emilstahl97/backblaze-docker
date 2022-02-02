
mkdir /home/emilstahl/shares
mkdir /home/emilstahl/shares/Backup
mkdir /home/emilstahl/shares/Data
mkdir /home/emilstahl/shares/Media
mkdir /home/emilstahl/shares/Temporary-Backblaze
mkdir /home/emilstahl/shares/appdata

sudo mount -t cifs -o username=emilstahl //192.168.1.2/Backup /home/emilstahl/shares/Backup

sudo mount -t cifs -o username=emilstahl //192.168.1.2/Data /home/emilstahl/shares/Data

sudo mount -t cifs -o username=emilstahl //192.168.1.2/Media /home/emilstahl/shares/Media

sudo mount -t cifs -o username=emilstahl //192.168.1.2/Temporary-Backblaze /home/emilstahl/shares/Temporary-Backblaze

sudo mount -t cifs -o username=emilstahl //192.168.1.2/appdata /home/emilstahl/shares/appdata

