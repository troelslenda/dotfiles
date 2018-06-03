#!/bin/sh

trackpadId=12
trackpointId=13

trackpadEnabled=($(exec xinput list-props $trackpadId | grep "Device Enabled"))
trackpadEnabled=${trackpadEnabled[-1]}
trackpointEnabled=($(exec xinput list-props $trackpointId | grep "Device Enabled"))
trackpointEnabled=${trackpointEnabled[-1]}

if [ "$trackpadEnabled" = "1" ]; then
    if [ "$trackpointEnabled" = "1" ]; then
        xinput --disable $trackpointId
        notify-send "Trackpoint disabled use Trackpad"
    else
        xinput --enable $trackpointId
        xinput --disable $trackpadId
        notify-send "Trackpad disabled use Trackpoint"
    fi
else
    xinput --enable $trackpadId
    notify-send "Trackpad and Trackpoint enabled"
fi