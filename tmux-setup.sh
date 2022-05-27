#!/bin/bash

# -- session -------------------

tmux new-session -s HF -d



# -- window 0 ------------------

#tmux send-keys -t HF:0.0 'tmux source-file tmux-mod.conf' Enter
tmux send-keys 'tmux source-file tmux-mod.conf' Enter


# -- new window ----------------

tmux new-window -n 'Client' -d



# -- new window ----------------

tmux new-window -n 'CA TSL' -d



# -- new window ----------------

tmux new-window -n 'CA INT' -d



# -- new window ------------------

tmux new-window -n 'CA ORG1' -d



# -- launch session ------------

tmux attach-session -t=HF

