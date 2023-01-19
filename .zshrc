# disable terminal session command history
SHELL_SESSION_HISTORY=0

# For completion support
#autoload -U +X bashcompinit && bashcompinit
#autoload -U +X compinit && compinit

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
eval "$(rbenv init -)"

# Add NVM support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

export GOPATH=$HOME/go

export ANDROID_HOME="/Users/danherman/Library/Android/sdk"
export ANDROID_TOOLS="/Users/danherman/Library/Android/sdk/tools/"
export ANDROID_PLATFORM_TOOLS="/Users/danherman/Library/Android/sdk/platform-tools/"
export PATH="/usr/local/opt/openssl/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/bin:/usr/local/bin:$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS":$HOME/vault
#echo $PATH

# Init sdkman
source "/Users/danherman/.sdkman/bin/sdkman-init.sh"

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

# Add SSH-Agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/danherman/.sdkman"
[[ -s "/Users/danherman/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/danherman/.sdkman/bin/sdkman-init.sh"

. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# # initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


# Created by `pipx` on 2021-09-13 20:34:03
export PATH="$PATH:/Users/danherman/.local/bin"

# Created by `pipx` on 2021-09-13 20:34:11
export PATH="$PATH:/Users/danherman/Library/Python/3.9/bin"


# command execution time plugin
#
# If command execution time above min. time, plugins will not output time.
export ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
export ZSH_COMMAND_TIME_MSG="Execution time: %s "

# Message color.
export ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
export ZSH_COMMAND_TIME_EXCLUDE=(vim)


_command_time_preexec() {
  # check excluded
  if [ -n "$ZSH_COMMAND_TIME_EXCLUDE" ]; then
    cmd="$1"
    for exc ($ZSH_COMMAND_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        # echo "command excluded: $exc"
        return
      fi
    done
  fi

  timer=${timer:-$SECONDS}
  ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG-"Time: %s"}
  ZSH_COMMAND_TIME_COLOR=${ZSH_COMMAND_TIME_COLOR-"cyan"}
  export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $timer_show -ge ${ZSH_COMMAND_TIME_MIN_SECONDS:-3} ]; then
      export ZSH_COMMAND_TIME="$timer_show"
      if [ ! -z ${ZSH_COMMAND_TIME_MSG} ]; then
        zsh_command_time
      fi
    fi
    unset timer
  fi
}

# zsh_command_time() {
#   if [ -n "$ZSH_COMMAND_TIME" ]; then
#     timer_show=$(printf '%dh:%02dm:%02ds\n' $(($ZSH_COMMAND_TIME/3600)) $(($ZSH_COMMAND_TIME%3600/60)) $(($ZSH_COMMAND_TIME%60)))
#     print -P "%F{$ZSH_COMMAND_TIME_COLOR}$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")%f"
#   fi
# }

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export VAULT_ADDR="http://127.0.0.1:8200"

# Add security scripts to PATH
export PATH="/Users/danherman/scratch/nucleus-cloudtrail/scripts:$PATH" 

autoload -Uz compinit
compinit
