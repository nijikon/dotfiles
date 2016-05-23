source ~/.profile

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias be='bundle exec'
alias tmx='tmux -S ~/.tmp/tmux.sock'
alias tmxa='tmx attach -t $1'
