#!/bin/sh
{
    # set -e;
    set -o errexit;
    set -o pipefail;
    output=$("$*");
    # print to STDout.
    echo "$output";
}