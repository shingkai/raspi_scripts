#!/bin/bash

# stop mmc0 from writing to LED
echo none > /sys/class/leds/led0/trigger

# turn on the LED (pin16) if the pi is connected to a network
if [ $(nmcli -t -f state general) == "connected" ]; then
    echo 1 > /sys/class/leds/led0/brightness
else
    echo 0 > /sys/class/leds/led0/brightness
fi

# email me the external ip when the pi starts up
# assumes mail has been setup
$(getip | mail -v -s "Raspib booted" $EMAIL)
