# aliases
source ~/.aliases.sh

# allows for tabbing out ssh servers form config file in .ssh
complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh

source ~/.aws_vars.sh

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

alias tmux="TERM=screen-256color-bce tmux"

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# color variables
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

# Set the bash prompt
export PS1="\W\[$GREEN\]\$(__git_ps1)\[$RESET\]$ "

# Add RBENV support
eval "$(rbenv init -)"
