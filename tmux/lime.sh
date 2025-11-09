


echo "Running lime.sh"


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

# Add Home Server and any other commonly used ssh sessions

# Call Work setup if --work flag?
tmux new-window -t $SESSION1:1 -n dev31
tmux send-keys -t $SESSION1:1 'ssh brokuser@ts3-dev31-ma -p ' C-m

# Lime.sh
# List of Servers I frequently use
# ts3-dev31-ma
# ts3-test6-jc
# ts3-fc33-ma
# prt27-dom-ct
# cit1-ma

# Select first window
tmux select-window -t $SESSION1:0

# Attach
tmux attach-session -t $SESSION1



