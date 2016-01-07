#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# bower
alias bower='noglob bower'

# Peco
if [[ -s "$HOME/linux_dotfiles/peco.zsh" ]]; then
  source "$HOME/linux_dotfiles/peco.zsh"
fi

# Autojump
. /usr/share/autojump/autojump.sh

# Project specific
export MENDY_WEB_SRC_PATH=/home/linhtm/Dev/github.com/gmo-mobile/minerva/web_root
export MENDY_AP_SRC_PATH=/home/linhtm/Dev/github.com/gmo-mobile//mercurius
export MENDY_ADMIN_SRC_PATH=/home/linhtm/Dev/github.com/gmo-mobile/janus

# Set 256color shell
if [ -e /lib/terminfo/x/xterm-256color  ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Base16 Shell
BASE16_SHELL="$HOME/Dev/github.com/chriskempson/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Thefuck
eval $(thefuck --alias fuk)
