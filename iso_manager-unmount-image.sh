#!/bin/bash

#################################################################
# For KDE-Services. 2012-2017.					            #
# By Geovani Barzaga Rodriguez <igeo.cu@gmail.com>		    #
# Improved by Victor Guardiola (vguardiola) Jan 5 2014		#
# 	-Fixed the problem of [dir|file]name with whitespaces.	#
# Imporved by Jaydeep Godara (JaydeepGo)  23 Sept 2018      #
#   -Remove fuseiso dependency to work on Fedora Linux      #
#################################################################

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/$USER/bin
MOUNTEXIT=""

##############################
############ Main ############
##############################

cd /tmp/

password=$(kdialog --password "Enter your password")

echo $password | sudo -S umount -l /tmp/$1
MOUNTEXIT=$?
rm  -rf $2


if [ "$MOUNTEXIT" = "0" ]; then
        kdialog --icon=ks-media-optical-mount --title="Unmount ISO Image" --passivepopup="[Finished] $1 Unmounted."
else
        kdialog --icon=ks-error --title="Unmount ISO Image" \
                   --passivepopup="[Error] Can't Unmount $1: ISO not mounted OR Wrong Password"
        exit 1
fi
exit 0
