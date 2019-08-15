#!/usr/bin/env bash

# TODO: Revisit this aspect of the setup.
# command -v xcodebuild >/dev/null 2>&1 || { 
#     echo >&2 "xcodebuild required but it's not installed.  Aborting."; 
#     exit 1; 
# }

# sudo xcodebuild -license

command -v curl >/dev/null 2>&1 || { 
    echo >&2 "curl required but it's not installed.  Aborting."; 
    exit 1; 
}

command -v babushka >/dev/null 2>&1 || { 
    sh -c "`curl https://babushka.me/up`"
}

babushka meet ""