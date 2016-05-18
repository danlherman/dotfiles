# Aliases

alias ll='ls -lh'
alias be='bundle exec'
alias vi='vim'
alias ~='cd ~'
alias gssh='~/.ssh/gen_ssh_config;complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh'

# Links to common directories
alias c='cd ~/gdr/projects/'
alias mpl='cd ~/gdr/projects/mpl'
alias sub='cd ~/gdr/projects/subscriber_portal'
alias doc='cd ~/gdr/projects/doc_control_client'
alias dot='cd ~/dotfiles'
alias cook='cd ~/gdr/projects/cookbook-opsworks' 
# alias dl='cd ~/gdr/projects/'

# Easy editing of aliases file
alias ea='vim ~/.aliases.sh'
alias sa='source ~/.aliases.sh'

# Git shortcuts
alias gc='git commit'
alias gpull='git pull'
alias gpush='git push'
alias gb='git checkout '
alias gs='git status'
