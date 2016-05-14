source ~/.profile

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
