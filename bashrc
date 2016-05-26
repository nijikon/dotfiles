source ~/.profile

ulimit -n 2048

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias be='bundle exec'
alias tmx='tmux -S ~/.tmp/tmux.sock'
alias tmxa='tmx attach -t $1'
