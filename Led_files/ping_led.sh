#!/bin/bash
# ping_led.sh
# Controls LED using Python when specific ping packet sizes are detected

# Continuously monitor ICMP echo requests
sudo tcpdump -l -n -i wlan0 icmp and icmp[icmptype]=8 | while read line; do
    # Extract the packet length
    length=$(echo "$line" | grep -o "length [0-9]*" | awk '{print $2}')

    if [ "$length" = "8" ]; then
        echo "PING length 8 → LED OFF"
        python3 /home/cmrasppi/led_control.py off

    elif [ "$length" = "9" ]; then
        echo "PING length 9 → LED ON"
        python3 /home/cmrasppi/led_control.py on

    else
        echo "Ping length $length → no action"
    fi
done

