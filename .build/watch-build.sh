#!/bin/bash
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

watchexec ".build/build-js-and-cp.sh"
