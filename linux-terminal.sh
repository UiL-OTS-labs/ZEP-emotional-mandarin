#!/bin/sh

#-------------------------------------------------------------------------------

# Define required Zep version:
ZEP_VER=1.15

# Iff installed at nonstandard location, define installation location here:
#ZEP_DIR=/opt/zep

#-------------------------------------------------------------------------------

USE=`echo use-zep-[0-9]*`
if [ -e $USE ]; then
	USE=`basename $USE .txt`
	VER=`echo $USE | cut -d- -f3`
	if [ -n "$VER" ]; then
	    ZEP_VER=$VER
	fi
fi

DONE=""
if [ -n "$ZEP_DIR" ]; then
	INITIAL_ZEP_DIR=$ZEP_DIR
	if [ -x $ZEP_DIR/$ZEP_VER/bin/zep ]; then
		DONE=1
	fi
fi

if [ ! "$DONE" ]; then
	ZEP_DIR=/usr/local/lib/zep
	if [ -x $ZEP_DIR/$ZEP_VER/bin/zep ]; then
		DONE=1
	fi
fi

if [ ! "$DONE" ]; then
	ZEP_DIR=/usr/lib/zep
	if [ -x $ZEP_DIR/$ZEP_VER/bin/zep ]; then
		DONE=1
	fi
fi

if [ ! "$DONE" ]; then
	PROGNAME=`basename $0`
	ZEP_DIR=
	echo Unable to locate Zep $ZEP_VER on your system. Tested following folders:
	if [ -n "$INITIAL_ZEP_DIR" ]; then
	    echo "  $INITIAL_ZEP_DIR"
	fi
	echo "  /usr/local/lib/zep"
	echo "  /usr/lib/zep"
	echo ""
	echo "Please (ask your system administrator to) install Zep $ZEP_VER into any"
	echo "of these locations or, in case you already have installed it (or want"
	echo "to install it) at a different location, then define the installation"
	echo "location in $PROGNAME."
	echo ""
	echo "For example if you have installed Zep $ZEP_VER at /home/john/mystuff/zep,"
	echo "then edit $PROGNAME and change this line:"
	echo "   #ZEP_DIR=/opt/zep"
	echo "to"
	echo "   ZEP_DIR=/home/john/mystuff/zep"
	echo "and try again."
	echo ""
	echo "Hit <Enter> to coninue."
	read x
	exit
fi

terminal=`which gnome-terminal`
if [ -x "$terminal" ]; then
#	echo Starting gnome-terminal
	$terminal --geometry=100x30 --title="Zep Terminal"
	exit
fi

terminal=`which mate-terminal`
if [ -x "$terminal" ]; then
#	echo Starting mate-terminal
	$terminal --geometry=100x30 --title="Zep Terminal"
	exit
fi

terminal=`which xfce4-terminal`
if [ -x "$terminal" ]; then
#	echo Starting xfce4-terminal
	$terminal --geometry=100x30 --title="Zep Terminal"
	exit
fi

terminal=`which konsole`
if [ -x "$terminal" ]; then
#	echo Starting konsole
	$terminal --geometry=100x30 --title="Zep Terminal"
	exit
fi

terminal=`which lxterminal`
if [ -x "$terminal" ]; then
#	echo Starting lxterminal
	$terminal --geometry=100x30 --title="Zep Terminal"
	exit
fi

terminal=`which rxvt-unicode`
if [ -x "$terminal" ]; then
#	echo Starting rxvt-unicode
	$terminal -geometry 100x30 -title "Zep Terminal" -bg lemonchiffon -fg black -sb &
	exit
fi

terminal=`which rxvt`
if [ -x "$terminal" ]; then
#	echo Starting rxvt
	$terminal -geometry 100x30 -title "Zep Terminal" -bg lemonchiffon -fg black -sb &
	exit
fi

terminal=`which xterm`
if [ -x "$terminal" ]; then
#	echo Starting xterm
	$terminal -geometry 100x30 -title "Zep Terminal" -bg lemonchiffon -fg black -sb &
	exit
fi
