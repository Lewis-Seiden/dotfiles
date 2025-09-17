#!/bin/bash

set -euo pipefail

monitor-sensor | \
    gawk '/Accelerometer orientation changed:/ {print $NF; fflush()}' | \
    while read -r line; do
        case "$line" in
        normal)
            niri msg output eDP-1 transform normal
            ;;
        bottom-up)
            niri msg output eDP-1 transform 180
            ;;
        right-up)
            niri msg output eDP-1 transform 270
            ;;
        left-up)
            niri msg output eDP-1 transform 90
            ;;
        esac
    done

