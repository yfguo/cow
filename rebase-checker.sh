#!/bin/bash
hash1=$(git show-ref --heads -s master)
hash2=$(git merge-base master HEAD)
if [ "${hash1}" = "${hash2}" ]; then
    echo "OK" 
    exit 0
else
    echo "Rebase is required"
    exit 1
fi
