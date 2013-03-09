#!/bin/bash

cd ~;
tmux new-session -d -s common
 
tmux new-window -t common:1 -n 'root' 'sudo su -'
tmux new-window -t common:2 -n 'music' 'cmus'
tmux new-window -t common:3 -n 'chat' 'irssi'

tmux select-window -t common:0
tmux -2 attach-session -t common

