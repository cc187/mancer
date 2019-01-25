#!/usr/bin/env bash

# get antlr4 alias :|
shopt -s expand_aliases
source ~/.bash_aliases

# build the gammar files and compile
cd grammar
antlr4 mancer.g4 -o ../gen
cd ../gen
javac mancer*.java
cd ..

