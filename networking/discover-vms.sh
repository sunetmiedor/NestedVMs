#!/usr/bin/env bash

#get initial child list on host
CHILD_LIST="[PROJECT DIRECTORY]/children.txt"

discover()
{
    #store child list argument
    local child_list="$1"

    #check if file exists
    [[ -f "$child_list" ]] || return 0

    #traverse child list
    while read -r name ip; do
        #output name and address of each found child, this will be saved upon calling the script into a map file on host
        echo "$name $ip"

        #execute the discover script recursively on each child in the list
        ssh -o BatchMode=yes "$USER@$ip" "bash -s" < "$0"
    done < "$child_list"
}

discover "$CHILD_LIST"