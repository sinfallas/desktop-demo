#!/bin/bash
if [ $USER != root ]; then
echo "Error: debes ser root"
exit 1
fi
case "$1" in
	kde)
		startx startkde -- :$2
		;;	

	lxde)
		startx startlubuntu -- :$2
		;;

	unity)
		startx unity -- :$2
		;;

	xfce)
		startx xfce4-session -- :$2
		;;

	virtualbox)
		startx virtualbox -- :$2
		;;

	install)
		apt -y install xubuntu-desktop lubuntu-desktop kubuntu-desktop virtualbox
		;;

	*)
		echo "USO: $0 {kde|lxde|unity|xfce|virtualbox|install} 1-6"
		exit 0
		;;
esac
exit 0
