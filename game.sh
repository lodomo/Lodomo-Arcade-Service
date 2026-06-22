#!/bin/sh
printf '\033c\033]0;%s\a' Test-Service
base_path="$(dirname "$(realpath "$0")")"
"$base_path/test-service.x86_64" "$@"
