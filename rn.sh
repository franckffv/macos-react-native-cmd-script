#!/bin/bash

if [[ -e "package.json" && $(cat package.json | grep "\"react-native\":" | wc -l) -gt 0 ]]; then

    PLATFORM="android"
    if [ "$1" == "ios" ]; then
        PLATFORM="ios"
    fi

    ID_DEVICE=""
    if [ "$1" == "-id" ]; then
        ID_DEVICE="$2"
        shift 2
    fi

    PROJECT_DIR="$(pwd)"

    osascript -e "tell application \"System Events\" to count (every process whose name is \"Terminal\")" > /dev/null
    if [ $? -eq 0 ]; then
        # Terminal is already running
        echo "Terminal is already running"
        osascript -e "tell application \"Terminal\" to activate"
    else
        echo "Terminal is not running"
        # Terminal is not running
        open -a Terminal
    fi
    osascript -e "tell application \"System Events\" to keystroke \"t\" using {command down}"
    osascript -e "tell application \"System Events\" to keystroke \"t\" using {command down}"

    osascript -e "tell application \"Terminal\" to do script \"cd $PROJECT_DIR && npx react-native start\" in tab 1 of window 1"
    osascript -e "tell application \"Terminal\" to do script \"cd $PROJECT_DIR && npx react-native run-$PLATFORM${ID_DEVICE:+ --deviceId $ID_DEVICE}\" in tab 1 of window 2"
else
    echo "The current directory is not a React Native project."
fi