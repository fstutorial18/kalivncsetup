/#!/bin/sh
# kali Linux Raspberry VNC Server Setup
# Script ini akan menginstall vncserver di Kali Linux Raspberry Pi 3 untuk VNC session
# Author - Febri Pranata
# Version 1.8
# www.fstutorial.com
# www.youtube.com/fstutorial
clear
/bin/cat <<'FSTutorial'
███████╗███████╗████████╗██╗   ██╗████████╗ ██████╗ ██████╗ ██╗ █████╗ ██╗     
██╔════╝██╔════╝╚══██╔══╝██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██║██╔══██╗██║     
█████╗  ███████╗   ██║   ██║   ██║   ██║   ██║   ██║██████╔╝██║███████║██║     
██╔══╝  ╚════██║   ██║   ██║   ██║   ██║   ██║   ██║██╔══██╗██║██╔══██║██║     
██║     ███████║   ██║   ╚██████╔╝   ██║   ╚██████╔╝██║  ██║██║██║  ██║███████╗
╚═╝     ╚══════╝   ╚═╝    ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝.com
                    Master Leader Favorit Anda Haha                                                                   
              www.fstutorial.com | youtube.com/fstutorial
FSTutorial
echo ""
echo "Pertama Kamu Harus Update System Kamu Dulu"
read -p "Apakah Kamu Mau Update (Recomended Banget) (Y/N)? " ans

if [ $ans = "y" ] || [ $ans = "Y" ]
then
  echo "Update Data Package Kamu.."
  sudo apt-get update -y
  echo "Upgrade Packages Lama Kamu.."
  sudo apt-get upgrade -y
fi
if [ ! -f ~/.vnc/passwd ]
then
echo "Setup VNC Server... "
echo "Masukan Password VNC Server Kamu"
vncserver
else
read -p "Apakah Kamu Mau Ganti Password VNC Server? [Y/N ] " tc_vncpass
	if [ $tc_vncpass = "y" ] || [ $tc_vncpass = "Y" ]
	then
		echo "Mengganti VNC Password "
		vncpasswd 
	fi
fi
echo "Langkah 1: Membuat autostart script untuk VNC session..."
read -p "Masukan Resolusi display yang kamu mau untuk VNC session (i.e. 800x600, 1024x768, 1280x720):- " tc_server
read -p "Masukan depth untuk VNC session (i.e. 16, 24, 32):- " tc_depth
cd /etc/init.d/
if [ -f FSTutorialvncsetup ]
then
rm FSTutorialvncsetup
update-rc.d FSTutorialvncsetup remove
fi
echo "#!/bin/sh
### BEGIN INIT INFO
# Provides: tightvncserver
# Required-Start: \$local_fs \$remote_fs \$syslog
# Required-Stop: \$local_fc \$remote_fs \$syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: auto setup vnc server
# Description: auto setup vncserver in kali linux for rpi
#
### END INIT INFO
# /etc/init.d/FSTutorialvncsetup
USER=root
HOME=/root
export USER HOME
case" '$1' "in
start)
/usr/bin/vncserver :1 -geometry" $tc_server" -depth" $tc_depth"
;;
stop)
pkill Xtightvnc
;;
*)
exit 1
;;
esac
exit 0
" > FSTutorialvncsetup
echo ""
echo "Langkah 2: Membuat Autostart Script"
echo "Tunggu Yaa..."; sleep 2;
chmod +x FSTutorialvncsetup
update-rc.d FSTutorialvncsetup defaults
echo "Selamat VNC Server Auto Start Session Sudah Terinstall"
read -p "Apakah Kamu Mau Restart Raspbery Mu (y/n)?: " tc_reboot
if [ $tc_reboot = "y" ] || [ $tc_reboot = "Y" ]; then
echo "Jangan Lupa subscribe FSTutorial YouTube channel"
echo "Terimah Kasih : Febri Pranata"; sleep 5;
reboot
else
echo "Don't forget subscribe FSTutorial YouTube channel"
echo "Terimah Kasih : Febri Pranata"
fi
