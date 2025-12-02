# Reflex Demo

This demo shows a very basic setup for an app using [Reflex-DOM](https://hackage.haskell.org/package/reflex-dom)

## Development

To learn more about Reflex consult the [Reflex Resources](ReflexResources.md) document which contains helpful links.

### Prerequisites
1. ghcup
1. cabal >= 3.14
1. ghc == 9.12.2
1. HLS

We recommend setting up these tools using [ghcup](https://www.haskell.org/ghcup/).

Additional requirements: 
- [hpack](https://github.com/sol/hpack) needs to be installed. You can install it using `cabal install hpack`.

### Install GHC with JavaScript backend
To install GHC with the JavaScript backend, use the following commands:
```
# cd to an appropriate directory!

git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install 3.1.74
./emsdk activate 3.1.74
source ./emsdk_env.sh

ghcup config add-release-channel cross

emconfigure ghcup install ghc --set javascript-unknown-ghcjs-9.12.2
```

Please note that the emsdk and the ghc versions always need to align.
The ghcup command always outputs in the beginning which emsdk version is needed.

### Run locally
1. Run `.build/build-js-and-cp.sh` to compile the project to HTML/JS
1. Run `.build/serve.sh` to run a local webserver that gives you easy access to the compiled files
1. You can then visit localhost on `http://localhost:8000`

For faster development you can run building watch mode with the command `.build/watch-build.sh` (requires the tool [watchexec](https://github.com/watchexec/watchexec). But you may of course also use the watch tool of your choice).
And for even more convenience use the command `.build/dev.sh`, which starts the build in watch mode and runs the web server.

### Running tests
Run all tests using: `.build/test.sh`.

### Code completion / Syntax Highlighting
If you are using VS Code, use the following extensions to have automatic code completion and syntax highlighting:
1. Haskell 
   1. On setup, you are asked whether you want to use the bundled ghcup or via PATH. We recommend using ghcup from PATH.
1. Haskell Syntax Highlighting

If you get shown the following kind of errors:

> It may not be listed in your .cabal file!
> Perhaps you need to add `YourModule` to other-modules or exposed-modules.

You will need to recreate the cabal file with hpack, which is automatically done by running one of the build scripts.

### Automatic formatting
To format your code locally using [Ormolu](https://github.com/tweag/ormolu), use either of the following options:

1. Use the integration into [HLS](https://haskell-language-server.readthedocs.io/en/stable/features.html#formatting), which is included in the Haskell extension for VS Code.
2. If you want to format your code manually, you can install Ormolu locally as described [here](https://github.com/tweag/ormolu#installation) and then use the command `ormolu --mode inplace $(git ls-files '*.hs')`.
