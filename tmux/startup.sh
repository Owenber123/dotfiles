#!/bin/bash

SESSION1=local

# Don't recreate if session already exists
tmux has-session -t $SESSION1 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Session $SESSION1 already exists. Attaching..."
  tmux attach-session -t $SESSION1
  # exit 0
fi

# Session 1
# SESSION1=local

# Window 1 Terminal
tmux new-session -d -s $SESSION1 -n terminal

# Window 2 zsh
tmux new-window -t $SESSION1:2 -n zsh
# This causes duplicate versions sometimes?
# tmux send-keys -t $SESSION1:1 'nvim .zshrc' C-m

# Window 3 config
tmux new-window -t $SESSION1:3 -n config
tmux send-keys -t $SESSION1:3 'cd ~/.config' C-m 'nvim .' C-m

# Window 4 notes
tmux new-window -t $SESSION1:4 -n todo
tmux send-keys -t $SESSION1:4 'cd ~/bloq/notes/' C-m 'nvim todo.md' C-m

# Window 5 weekly-dev
tmux new-window -t $SESSION1:5 -n weekly
tmux send-keys -t $SESSION1:5 'cd ~/bloq/weekly-dev/' C-m 'nvim .' C-m

# Window 6 ostep-hw
tmux new-window -t $SESSION1:6 -n ostep
tmux send-keys -t $SESSION1:6 'cd ~/bloq/ostep-homework/' C-m 'nvim .' C-m

# Window 6 ostep-hw
tmux new-window -t $SESSION1:7 -n sbe
tmux send-keys -t $SESSION1:7 'cd ~/bloq/sbe/' C-m 'nvim .' C-m


# ./.tmux/lime.sh
echo "Are we Working Today?"
read -p "[y/n]: " answer
if [ "$answer" != "y" ]; then
  tmux select-window -t $SESSION1:1
  tmux attach-session -t $SESSION1
  exit 0
fi

# Session 2
SESSION2=remote

# Don't recreate if session already exists
tmux has-session -t $SESSION2 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Session $SESSION2 already exists. Attaching..."
  tmux attach-session -t $SESSION2
  exit 0
fi

# Window 1 Terminal
tmux new-session -d -s $SESSION2 -n terminal

tmux new-window -t $SESSION2:2 -n todo
tmux send-keys -t $SESSION2:2 'cd Lime' C-m 'nvim todo.md' C-m

tmux new-window -t $SESSION2:3 -n claude
tmux send-keys -t $SESSION2:3 'claude' C-m

tmux new-window -t $SESSION2:4 -n dev31
tmux send-keys -t $SESSION2:4 'ssh dev31' C-m 'cd owen_regression' C-m

tmux new-window -t $SESSION2:5 -n configuration
tmux send-keys -t $SESSION2:5 'ssh fc33' C-m 'cd configuration' C-m 'nvim .' C-m

tmux new-window -t $SESSION2:6 -n citrius
tmux send-keys -t $SESSION2:6 'ssh fc33' C-m 'cd citrius' C-m 'nvim .' C-m

tmux new-window -t $SESSION2:7 -n test6
tmux send-keys -t $SESSION2:7 'ssh test6' C-m

tmux new-window -t $SESSION2:8 -n test7
tmux send-keys -t $SESSION2:8 'ssh test7' C-m

# tmux new-window -t $SESSION2:5 -n cit1
# tmux send-keys -t $SESSION2:5 'ssh brokuser@cit1-ma' C-m
#
# tmux new-window -t $SESSION2:6 -n prt27
# tmux send-keys -t $SESSION2:6 'ssh brokuser@prt27-dom-ct' C-m
#
tmux new-window -t $SESSION2:9 -n jhist4-sc
tmux send-keys -t $SESSION2:9 'ssh brokuser@jhist4-sc' C-m
#
# tmux new-window -t $SESSION2:8 -n pts1-jc
# tmux send-keys -t $SESSION2:8 'ssh brokuser@pts1-jc' C-m
#
# tmux new-window -t $SESSION2:9 -n trs1-jc
# tmux send-keys -t $SESSION2:9 'ssh brokuser@trs1-jc' C-m
#
# tmux new-window -t $SESSION2:10 -n ts3-test-ma
# tmux send-keys -t $SESSION2:10 'ssh brokuser@ts3-test-ma' C-m


# Lime.sh
# List of Servers I frequently use
# ts3-dev31-ma
# ts3-test6-jc
# ts3-fc33-ma
# prt27-dom-ct
# cit1-ma

# Select first window
tmux select-window -t $SESSION2:1

# Attach
tmux attach-session -t $SESSION2



