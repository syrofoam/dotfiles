#!/usr/bin/env bash
# Status script for dwm
# colours: 01:normal 02:white 03:red 04:green 05:yellow 06:blue
# 07:cyan 08:magenta 09:grey
# Copyright (c) 2013-2019 Stian
tem(){
 tem="$(</sys/class/thermal/thermal_zone1/temp)"
 echo -e "${tem%000*}"
}

bat(){
  onl="$(</sys/class/power_supply/AC/online)"
  charge="$(</sys/class/power_supply/BAT0/capacity)"
  if [[ $onl -eq 0 && $charge -ge 10 ]]; then
     printf "%b" "BAT $charge%\x01"
  elif [[ $onl -eq 0 && $charge -le 5 ]]; then
    printf "%b" "BAT $charge%\x01"
  else
    printf "%b" "AC $charge%\x01"
  fi
}

mem(){
  mem="$(awk '/^Mem/ {print $3}' <(free -m))"
#  printf "%b" "\x04$mem\x01"
  echo -e "$mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu="$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))"
#  printf "%b" "\x05$cpu%\x01"
  echo -e "$cpu"
}

#hdd(){
#  hd=( $(awk '
#    {i=$5} /boot/ {a=i}; /root/ {b=i}; /home/ {c=i}; /media/ {d=i}
#    END {if (NR>=11) print a,b,c,d; else print a,b,c}
#           ' <(df -P)) )
#  drives="${#hd[@]}"
#  if (( drives > 3 )); then
#    printf "%b " "\x08${hd[@]:0:3} \x06${hd[@]:3:1}\x01"
#  else
#    printf "%b " "\x08${hd[@]}\x01"
#  fi
#}

dte(){
  dte="$(date "+%T")"
  #printf "%b" "\x02$dte\x01"
  printf "%b" "$dte"
  #echo -e "$date"
}

#print_volume() {
#        volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
#        if test "$volume" -gt 0
#        then
#                echo -e "\uE05D${volume}"
#        else
#                echo -e "Mute"
#        fi
#}

# Pipe to status bar
while true; do
	xsetroot -name "$(tem)°C • $(bat) • CPU $(cpu) • MEM $(mem) • $(dte)"
	sleep 60s
done &
