# aliases
source ~/.bash/bash_aliases
source ~/.private_vars.sh

# default editor
export EDITOR='vim'

# shell prompt with git status
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\W\[$txtgrn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "

# Add RBENV support
eval "$(rbenv init -)"

# Mac specific stuff
if [[ "$OSTYPE" == "darwin*" ]]; then
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
