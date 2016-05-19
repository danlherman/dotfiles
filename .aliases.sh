# Aliases

alias ll='ls -lh'
alias be='bundle exec'
alias vi='vim'
alias ~='cd ~'
alias genssh='~/.ssh/gen_ssh_config;complete -o default -o nospace -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh'

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

# Update dotfiles if there are any changes
alias dotu='for file in $(diff -qr ./ ~/ | grep differ | cut -d " " -f 4); do fp "$file"; echo "$file"; done'

function fp {
  # cp $1 ~/dotfiles/${1#*/*/*/}
  cp "$1" ~/dotfiles/"${1#*/*/*/}"
}
