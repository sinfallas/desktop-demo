#!/bin/bash
if [ $USER != root ]; then
echo "Error: debes ser root"
exit 1
fi
trap "rm -f /run/desktop-demo.pid; exit" INT TERM EXIT
echo $BASHPID > /run/desktop-demo.pid
case "$1" in
	kde)
		startx startkde -- :$2
		;;	

	gnome)
		startx gnome-shell -- :$2
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
		apt update
		apt -y install xubuntu-desktop gnome kubuntu-desktop virtualbox
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	*)
		echo "USO: $0 {kde|gnome|unity|xfce|virtualbox|install} 1-6"
		;;
esac
rm -f /run/desktop-demo.pid
trap - INT TERM EXIT
exit 0
