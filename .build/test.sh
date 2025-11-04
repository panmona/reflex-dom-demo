#!/bin/bash

# fail on first error afterwards
set -e

script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"
cd ..

FAIL_ON_WARNING=false
FAIL_ON_FOCUS=false
for arg in "$@"; do
  case $arg in
    --fail-on-warning)
    FAIL_ON_WARNING=true
    shift
    ;;
  esac
  case $arg in
    --fail-on-focus)
    FAIL_ON_FOCUS=true
    shift
    ;;
  esac
done

GHC_OPTIONS=""
if [ "$FAIL_ON_WARNING" == "true" ]; then
  GHC_OPTIONS="--ghc-options=-Werror"
fi

TEST_OPTIONS=""
if [ "$FAIL_ON_FOCUS" == "true" ]; then
  TEST_OPTIONS="--test-option=--fail-on=focused"
fi

# Generate up to date cabal file
hpack package.yaml

cabal build ui-shared-test core-test $GHC_OPTIONS
cabal test $GHC_OPTIONS $TEST_OPTIONS
