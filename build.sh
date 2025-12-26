#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "debugbreak.h" ]; then return; fi
URL="https://github.com/scottt/debugbreak/raw/refs/heads/master/debugbreak.h"
FILE="debugbreak.h"

# Download the release
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-break.c ..."
clang -I. -o 01.exe examples/01-break.c  && ./01.exe && echo -e "\n"
echo "Running 02-fib.c ..."
clang -I. -o 02.exe examples/02-fib.c    && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
