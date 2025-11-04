#!/bin/bash
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

# & runs commands at same time
.build/watch-build.sh & .build/serve.sh
