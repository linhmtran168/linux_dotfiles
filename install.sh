#!/bin/sh
# Create ssh key => do manually => upload to github
# ssh-keygen -t rsa -b 4096 -C "email"
# Clone dotfiles directory
cd ~
git clone git@github.com:linhmtran168/linux_dotfiles.git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install brew package
brew install dust diff-so-fancy bat sd hyperfine exa fd fzf xh \
    ghq golang helm hadolint ripgrep sd starship tokei \
    tealdeer cheat curlie git-delta duf procs direnv nvim
brew install clementtsang/bottom/bottom

# Fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
# Change default shell to fish
# Must run sudo vim /etc/shells to add fish to list of shell
chsh -s /usr/bin/fish
## OMF
curl -L https://get.oh-my.fish | fish
omf update
omf install python rustup
/home/linuxbrew/.linuxbrew/opt/fzf/install
zoxide init --cmd cd --hook prompt fish

# Symlink config file for git and fish
ln -sf ~/linux_dotfiles/.gitignore ~/.gitignore
cp ~/linux_dotfiles/.gitconfig ~/.gitconfig # must manually change email in git config
ln -sf ~/linux_dotfiles/init.fish ~/.config/omf/init.fish
ln -sf ~/linux_dotfiles/key_bindings.fish ~/.config/omf/key_bindings.fish
ln -sf ~/linux_dotfiles/starship.toml ~/.config/starship.toml

# Vim
ln -sf ~/linux_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undodir

# Base 16
# ghq get git@github.com:martinlindhe/base16-iterm2.git # Manually change theme using iterm config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell # Use base16-xxx shell command to change theme

# Powerline
pip3 install powerline-status psutil
ghq get git@github.com:powerline/powerline.git

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/linux_dotfiles/.tmux.conf ~/.tmux.conf

# Ruby
# ASDF
# Ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest
asdf reshim ruby latest
gem install pry

# Nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts
asdf reshim nodejs lts

# Rust
curl https://sh.rustup.rs -sSf | sh

# Docker
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

