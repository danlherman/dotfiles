# For completion support
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# aliases
source ~/.bash/bash_aliases
source ~/.private_vars.sh

# extend timeout for AWS when on slowing networks
export AWS_CLIENT_TIMEOUT=900000

# use most for PAGER if installed
#if command -v most > /dev/null 2>&1; then
#  export PAGER="most"
#fi

# bash vi mode
set -o vi

# default editor
export EDITOR='vim'

# shell prompt with git status
# export GITAWAREPROMPT=~/.bash/git-aware-prompt
# Now for ZSH
export GITAWAREPROMPT=~/.zsh/git-aware-prompt
source $GITAWAREPROMPT/main.sh
# export PS1="\W\[$txtgrn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
# for ZSH
export PROMPT='%1~%{$txtgrn%}$git_branch%{$bldgrn%}$git_ahead_mark$git_ahead_count%{$bldred%}$git_behind_mark$git_behind_count%{$bldylw%}$git_stash_mark%{$txtrst$txtylw%}$git_dirty$git_dirty_count%{$txtcyn%}$git_staged_mark$git_staged_count%{$txtblu%}$git_unknown_mark$git_unknown_count%{$txtrst%}$ '
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

# Add RBENV support
#eval "$(rbenv init -)"

# Add NVM support
export NVM_DIR=~/.nvm
if [[ "$OSTYPE" == "darwin19.0" ]]; then
  source /usr/local/opt/nvm/nvm.sh  # This loads NVM
fi

# Mac specific stuff
if [[ "$OSTYPE" == "darwin19.0" ]]; then
  # allows for tabbing out ssh servers form config file in .ssh (this automatically works in Linux)
  complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
  # Pry History Issues
  # export RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`
  # MySQL support
  # MYSQL=/usr/local/mysql/bin
  # export PATH=$PATH:$MYSQL
  # export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
fi
# export PATH="/usr/local/opt/openssl/bin:$HOME/go/bin:/usr/local/bin:$PATH:/Users/danherman/gdr/projects/pledge_bc/gdr_build_hl/bin"
export PATH="/usr/local/opt/openssl/bin:$HOME/go/bin:/usr/local/bin:$PATH"

export GOPATH=$HOME/go

# The next line updates PATH for the Google Cloud SDK.
#source /Users/danherman/google-cloud-sdk/path.zsh.inc

# The next line enables zsh completion for gcloud.
#source /Users/danherman/google-cloud-sdk/completion.zsh.inc

# export PATH="/usr/local/opt/go@1.10/bin:$PATH"

# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/sls.zsh
# # tabtab source for slss package
# # uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/danherman/gdr/projects/mpl_web_api2/node_modules/tabtab/.completions/slss.zsh
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/danherman/.ssh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danherman/.ssh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/danherman/.ssh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danherman/.ssh/google-cloud-sdk/completion.zsh.inc'; fi
