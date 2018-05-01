#!/bin/sh

SYSXHCI=/sys/bus/pci/drivers/xhci_hcd

if [ "$(id -u)" != 0 ] ; then
 echo This must be run as root!
 exit 1
fi

if ! cd $SYSXHCI ; then
 echo Weird error. Failed to change directory to $SYSXHCI
 exit 1
fi

for dev_id in ????:??:??.? ; do
 printf "${dev_id}" > unbind
 printf "${dev_id}" > bind
done
