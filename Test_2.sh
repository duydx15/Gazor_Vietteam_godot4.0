#!/bin/sh
echo -ne '\033c\033]0;Gazō Tuber\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Test_2.x86_64" "$@"
