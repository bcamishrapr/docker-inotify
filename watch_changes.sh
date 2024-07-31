#!/bin/bash

# Directory to watch for changes
WATCH_DIR="/workdir"

# Command to execute upon changes
COMMAND_TO_RUN="cp -r /workdir/* /processed/"

# Function to execute command
execute_command() {
    echo "Changes detected. Running command: $COMMAND_TO_RUN"
    eval "$COMMAND_TO_RUN"
}

# Watch for changes
while true; do
    # Wait for any change in the directory
    inotifywait -e modify,create,delete -r "$WATCH_DIR" && execute_command
done
