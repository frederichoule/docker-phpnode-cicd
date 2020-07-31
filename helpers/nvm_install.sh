#!/bin/bash

export NVM_DIR="$HOME/.nvm" && . "$NVM_DIR/nvm.sh" --no-use
eval "[ -f .nvmrc ] && nvm install || nvm install stable"
n=$(which node)
n=${n%/bin/node}
chmod -R 755 $n/bin/*
cp -r $n/{bin,lib,share} /usr/local