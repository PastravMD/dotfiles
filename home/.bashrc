# Bashrc

# If not running interactively return
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export HISTCONTROL=ignoreboth:erasedups

# Shell options
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

# Prompt
PROMPT_DIRTRIM=5
PS1='\[\e[1;32m\]\w \$ \[\e[0m\]'

# Alias
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias tags-here='export CSCOPE_DB=$PWD; rm cscope.out tags; cscope -b -R; ctags --recurse;'

# Infinite  history
export HISTFILESIZE=
export HISTSIZE=
export HISSTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_infinite_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export TERM=rxvt-unicode
export EDITOR=vim

#source "$HOME/.homesick/repos/homeshick/homeshick.sh"
#source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
