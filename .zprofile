#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Wine Setting
export WINEARCH=win32

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

# IBUS
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#
# Paths
#

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Hadoop
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

# HIVE and HCATALOG
export HIVE_HOME=/home/linhtm/.linuxbrew/Cellar/hive/1.1.1/libexec
export HCAT_HOME=/home/linhtm/.linuxbrew/Cellar/hive/1.1.1/libexec/hcatalog

# Composer
export COMPOSER_DIR=$HOME/.composer

# Rbenv root
export RBENV_ROOT=$HOME/.rbenv

# Linuxbrew
export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH

# Go
export GOPATH=$HOME/Dev/go

# NVM
export NVM_DIR=$HOME/.nvm

# Anaconda
export ANACONDA_PATH=$HOME/anaconda3

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $ANACONDA_PATH/bin
  $GOPATH/bin
  $COMPOSER_DIR/vendor/bin
  $RBENV_ROOT/bin
  $HOME/.local/bin
  $HOME/.linuxbrew/bin
  $HOME/.linuxbrew/sbin
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# NVM
source $(brew --prefix nvm)/nvm.sh

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Ubuntu make installation of Rust Lang
PATH=/home/linhtm/.local/share/umake/rust/rust-lang/rustc/bin:/home/linhtm/.local/share/umake/rust/rust-lang/cargo/bin:$PATH
export LD_LIBRARY_PATH=/home/linhtm/.local/share/umake/rust/rust-lang/rustc/lib:$LD_LIBRARY_PATH

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/linhtm/.local/share/umake/bin:$PATH
