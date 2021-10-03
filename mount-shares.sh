mkdir /mnt/shares/Backup
mkdir /mnt/shares/Data
mkdir /mnt/shares/Media
mkdir /mnt/shares/Temporary-Backblaze

sudo mount -t cifs -o username=emilstahl //192.168.97.147/Backup /mnt/shares/Backup

sudo mount -t cifs -o username=emilstahl //192.168.97.147/Data /mnt/shares/Data

sudo mount -t cifs -o username=emilstahl //192.168.97.147/Media /mnt/shares/Media

sudo mount -t cifs -o username=emilstahl //192.168.97.147/Media /mnt/shares/Media

sudo mount -t cifs -o username=emilstahl //192.168.97.147/Temporary-Backblaze /mnt/shares/Temporary-Backblaze
