# aliases
source ~/.bash/bash_aliases

# allows for tabbing out ssh servers form config file in .ssh
if [[ "$OSTYPE" == "darwin*" ]]; then
  complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
fi

source ~/.aws_vars.sh

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

alias tmux="TERM=screen-256color-bce tmux"

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   # Load the linux git-aware prompt
#   export GITAWAREPROMPT=~/.bash/git-aware-prompt
#   source $GITAWAREPROMPT/main.sh
#   export PS1="\u@\h \w\[$txtcyn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   # Load in the git branch prompt script for mac
#   source ~/.git-prompt.sh
#   # color variables
#   GREEN="\[$(tput setaf 2)\]"
#   RESET="\[$(tput sgr0)\]"
#   # Set the bash prompt
#   export PS1="\W\[$GREEN\]\$(__git_ps1)\[$RESET\]$ "
# fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\W\[$txtgrn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "

# Add RBENV support
eval "$(rbenv init -)"

# Pry History Issues
if [[ "$OSTYPE" == "darwin*" ]]; then
  export RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`
fi
