#!/bin/bash

if [[ ! ${1} =~ [0-9] || ${1} -lt 1 ]]; then
    echo -e "\033[1;31mWrong argument type \"${1}\"\nUse only numbers!\033[0m"
    exit 9
fi;

function timer_countdown () {
    local timeArgument=$1

    ((--timeArgument))
    echo
    tput civis

    for timeToShow in $(seq  $timeArgument -1 0); do
        tput sc
        sleep 1
        echo -n "$timeToShow "
        tput rc
    done;

    echo
    tput cnorm
}

timer_countdown $1