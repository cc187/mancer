#!/usr/bin/env bash

# get antlr4 alias :|
shopt -s expand_aliases
source ~/.bash_aliases

# test with the user-provided rule
cd gen
grun mancer $1 -$2
cd ..
