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
mkdir -p /tmp/$2

sudo  mount -o loop $1 /tmp/$2
MOUNTEXIT=$?

if [ "$MOUNTEXIT" = "0" ]; then
   kdialog --icon=ks-media-optical-mount --title="Mount ISO Image" --passivepopup="[Finished] $2 mounted."
else
   kdialog --icon=ks-error --title="Mount ISO Image" \
                   --passivepopup="[Error] Can't mount $2: Already mount or check image integrity."
   exit 1
fi

exit 0
