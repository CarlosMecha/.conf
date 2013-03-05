#!/bin/bash

cd ~;
tmux new-session -d -s common
 
tmux new-window -t common:1 -n 'root' 'sudo su -'

tmux select-window -t common:0
tmux -2 attach-session -t common

