#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias ssh='TERM=xterm-256color ssh'
alias hp='hyprland'
alias nano='nano -L -l'
PS1='[\u@\h \W]\$ '
