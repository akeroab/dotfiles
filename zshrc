# Path to oh-my-zsh.
export ZSH=$HOME/.oh-my-zsh
DISABLE_LS_COLORS="true"
plugins=(osx nvm npm)
source $ZSH/oh-my-zsh.sh

# Java environment variable
export JAVA_HOME=$(/usr/libexec/java_home)

# NVM environment variable
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# completion path
fpath=(/usr/local/share/zsh/site-functions $fpath)
