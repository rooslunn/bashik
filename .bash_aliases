alias eb="vim $HOME/.bash_aliases"
alias eba="vim $HOME/.bash_apps"
alias sos="source $HOME/.bashrc"

alias ll="ls -alhF"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -rv"
alias mkd="mkdir -p"

alias gi="git"
alias compot="composer"

alias cplh="fc -ln -1 | xsel --clipboard"
alias xsel="xsel --clipboard"

alias cdl="cd $HOME/Downloads"
alias cdk="cd /media/roos/ext4/kino"
alias cdk2="cd /media/roos/USB2/kino"
alias cdd="cd $HOME/utv"
#alias cdc="cd $HOME/utv/sputnik/rss-reader"
alias less="less -N"

alias mpv="gnome-session-inhibit mpv --"
alias py3="python3"
alias vpip=".venv/bin/pip"
alias vpy=".venv/bin/python"
alias sql3="sqlite3"

alias arty="php artisan"
alias pint="vendor/bin/pint"
alias stan="vendor/bin/phpstan analyse"
alias pest="pint && stan && arty test --coverage"

#alias gest="go test -v -cover ./..."
alias gest="gotestsum -- -v -cover ./..."
alias gcov="go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out"
alias gben="go test -bench=. -benchmem ./..."
alias gprf="go test -bench=$1 -cpuprofile cup.prof -memprofile mem.prof -benchmem ."

alias phpun="vendor/bin/phpunit"

export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export CGO_ENABLED=1

export PATH=$PATH:$HOME/.local/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin

if [ -f ~/.bash_apps ]; then
    . ~/.bash_apps
fi
