#!/bin/sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if [ "$status" = Discharging -a "$capacity" -lt 5 ]; then
		logger "Critical battery threshold"
		systemctl suspend
	fi
    if [ "$status" = Full -a "$capacity" -eq 100 ]; then
        notify-send -u normal "Battery fully charged"
    fi
}
