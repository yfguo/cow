#!/bin/sh
#
# (C) 2018 by Argonne National Laboratory.
#     See COPYRIGHT in top-level directory.
#

OUTPUT_FILE="merged-output.txt"

if test $# -eq 1 ; then
    OUTPUT_FILE="$1"
fi

for file in $(find . -name "*.*.cow-out" | tr "\n" " ") ; do
    if test -s "$file" ; then
        {
            echo "00000000000000000000"
            echo "${file%.out}"
            cat "$file"
        } >> "$OUTPUT_FILE"
    fi
done

find . -name "*.*.cow-out" | xargs rm
