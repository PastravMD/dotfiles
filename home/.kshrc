#!/bin/ksh

# Prompt
export PS1="\033[1;31m\w \$ \033[0m"

### colored ls output #####################################
alias ls='colorls -G'
export LSCOLORS=exfxcxdxbxegedabagacad
export CLICOLOR=1

alias tags-here='export CSCOPE_DB=$PWD; rm cscope.out tags; cscope -b -R; ctags --recurse;'
alias prettylog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'


