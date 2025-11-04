#!/bin/bash
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

fileserver_path="fileserver"
(cd $fileserver_path && hpack package.yaml && cabal run)
