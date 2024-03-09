#!/bin/sh

active_windows=$(eww active-windows)

if [[ $active_windows = *'cal'* ]]; then
			eww close cal
else
			eww open cal
fi
