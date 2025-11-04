#!/bin/bash
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

FILESERVER_PATH="fileserver"

GHCJS_VERSION="9.12.2"
EXE_PATH="dist-newstyle/build/javascript-ghcjs/ghc-${GHCJS_VERSION}/reflex-demo-0.1.0.0/x/reflex-demo-exe/build/reflex-demo-exe/reflex-demo-exe.jsexe/"
.build/build-js.sh && rm -rf $FILESERVER_PATH/serve && cp -r $EXE_PATH $FILESERVER_PATH/serve
