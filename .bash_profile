# aliases
source ~/.bash/bash_aliases
source ~/.private_vars.sh

# extend timeout for AWS when on slowing networks
export AWS_CLIENT_TIMEOUT=900000

# bash vi mode
set -o vi

# default editor
export EDITOR='vim'

# shell prompt with git status
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\W\[$txtgrn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

# Add RBENV support
eval "$(rbenv init -)"

# Add NVM support
export NVM_DIR=~/.nvm
if [[ "$OSTYPE" == "darwin17" ]]; then
  source /usr/local/opt/nvm/nvm.sh  # This loads NVM
fi

# Mac specific stuff
if [[ "$OSTYPE" == "darwin17" ]]; then
  # allows for tabbing out ssh servers form config file in .ssh (this automatically works in Linux)
  complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
  # Pry History Issues
  export RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`
  # MySQL support
  MYSQL=/usr/local/mysql/bin
  export PATH=$PATH:$MYSQL
  export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
fi
export PATH="/usr/local/opt/openssl/bin:$PATH"
