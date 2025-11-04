#!/bin/bash

# fail on first error afterwards
set -e

script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

FAIL_ON_WARNING=false
for arg in "$@"; do
  case $arg in
    --fail-on-warning)
    FAIL_ON_WARNING=true
    shift
    ;;
  esac
done

GHC_OPTIONS=""
if [ "$FAIL_ON_WARNING" == "true" ]; then
  GHC_OPTIONS="--ghc-options=-Werror"
fi

# Generate up to date cabal file
hpack package.yaml

cabal build --with-ghc=javascript-unknown-ghcjs-ghc --with-ghc-pkg=javascript-unknown-ghcjs-ghc-pkg --with-hsc2hs=javascript-unknown-ghcjs-hsc2hs --minimize-conflict-set $GHC_OPTIONS

# Copy static files
GHCJS_VERSION="9.12.2"
EXE_PATH="dist-newstyle/build/javascript-ghcjs/ghc-${GHCJS_VERSION}/reflex-demo-0.1.0.0/x/reflex-demo-exe/build/reflex-demo-exe/reflex-demo-exe.jsexe/"
cp -r ui/static $EXE_PATH
mv $EXE_PATH/static/favicon.ico $EXE_PATH/favicon.ico
