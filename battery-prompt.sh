#!/bin/bash

GRAY="1;30"
CYAN="0;36"
LIGHT_CYAN="1;36"
LIGHT_BLUE="1;34"
YELLOW="1;33"
WHITE="0;1"
NO_COLOR="0"
LIGHT_RED="1;31"
LIGHT_GREEN="1;32"
BROWN="0;33"

function get_battery_info()
{
    BATT_INFO=$(acpi -b | awk -F', ' '{print $2}')
    AC_INFO=$(acpi -a | awk -F': ' '{print $2}')

    if [ $AC_INFO = "off-line" ]
    then
        BATT_PERC=${BATT_INFO:0:${#BATT_INFO}-1}

        if [ $BATT_PERC -ge 75 ]
        then
            COLOR=$LIGHT_GREEN
        elif [ $BATT_PERC -le 25 ]
        then
            COLOR=$LIGHT_RED
        else
            COLOR=$YELLOW
        fi
    else
        COLOR=$NO_COLOR
    fi
}

PROMPT_COMMAND=get_battery_info
PS1="\t \[\033[\$(echo -n \$COLOR)m\]\$(echo -n \$BATT_INFO)\[\033[${NO_COLOR}m\] \u@\h \[\033[${WHITE}m\]\w\[\033[${NO_COLOR}m\]\$ "
