# Set language
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
# Go
set -xg GOPATH "$HOME/go"
set -xg CC "gcc"
set -xg CXX "g++"
# Default editor
set -xg VISUAL "vim"
set -xg EDITOR "$VISUAL"
# Set path
set --universal fish_user_paths $HOME/bin $HOME/.local/bin $HOME/go/bin $GOPATH/bin $HOME/.cargo/bin $HOME/.krew/bin $HOME/.composer/vendor/bin /home/linuxbrew/.linuxbrew/opt/openjdk/bin $HOME/.cargo/bin

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Linuxbrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Starship
starship init fish | source

# FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
source $HOME/linux_dotfiles/fzf.fish

# dir colors
# bass (dircolors ~/wsl_dotfiles/dircolors.base16.dark)

# Directory
alias dev='cd $HOME/Dev'

# tmux
alias tma='tmux attach -t'
alias tmd='tmux new -s (basename (pwd))'
alias tmn='tmux new -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# Python
alias pip=pip3

# Kubernetes
alias k9sDanger=/home/linuxbrew/.linuxbrew/bin/k9s
alias k9s='k9s --readonly'

