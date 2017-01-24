#!/bin/sh
if [ "$1"  = "" ]; then
    echo "Please specify nickname for this adapter."
    exit 1
fi
OUTFILE=$1.yml
USBPORT="2-2"
USBDIR=/sys/bus/usb/devices/$USBPORT
if [ ! -f $OUTFILE ]; then
    cat >$OUTFILE <<EOF
nickname: $1
commercial name:
ASIN:
vendor_id: "$(cat $USBDIR/idVendor)"
vendor_name: "$(cat $USBDIR/manufacturer)"
product_id: "$(cat $USBDIR/idProduct)"
product_name: "$(cat $USBDIR/product)"
amps:
noise_rating:
level_rating:
comments:
EOF
    eval $(grep ^DEVNAME $USBDIR/uevent)
    sudo lsusb -D /dev/$DEVNAME > $1.usb
fi
vi $OUTFILE
amixer -c 2 sset Speaker 100%
echo "Press enter to play sine wave..."
read foo
AUDIODEV=hw:2,0 play -n synth 10 sine
vi $OUTFILE +11

