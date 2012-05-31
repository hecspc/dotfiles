#!/bin/sh
#
# Back-Up Directory

FECHA=`date`;
rsync -vba ~/Sites cgaplay.org:~/bkup/
rsync -vba ~/Documents/processing cgaplay.org:~/bkup/
#rsync -vba ~/Documents/AS2Frameworks cgaplay.org:~/bkup/
rsync -vba ~/Documents/AS3Frameworks cgaplay.org:~/bkup/
rsync -vba ~/Documents/fdt3 cgaplay.org:~/bkup/
#rsync -vba ~/Documents/ cgaplay.org:~/bkup/
#rsync -vba ~/Documents/Trabajo cgaplay.org:~/bkup/
if [ $? -eq 0 ];then
	echo "Backup realizado con exito el `date`" >> ~/Library/Logs/rsync.log
	/usr/local/bin/growlnotify -p High --appIcon Cronnix -t Backup -m 'Backup terminado con exito'
else
    echo "!!!! Backup ha fallado `date`" >> ~/Library/Logs/rsync.log
	/usr/local/bin/growlnotify -s -p Emergency --appIcon Cronnix -t Backup -m 'Backup ha fallado debido a errores'
fi 
