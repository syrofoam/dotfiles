#!/bin/bash
echo "WHAT IS YOUR COMMAND MASTER? ↑Kill-Steam ←Exit →Disk Usage ↓Show Local IP-adress"
ESC=$(echo -en "\033")                     # define ESC
while :;do                                 # infinite loop
read -s -n3 key 2>/dev/null >&2            # read quietly three characters of served input
  if [ "$key" = "$ESC[A" ];then pkill steam;fi #up
  if [ "$key" = "$ESC[B" ];then ip -4 addr ;fi #down
  if [ "$key" = "$ESC[C" ];then duf -only-fs btrfs;fi #right
  if [ "$key" = "$ESC[D" ];then exit;fi #left
done
