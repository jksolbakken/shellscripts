alias tot='du -cksh'

alias rmdocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

alias weather='curl v2.wttr.in/Oslo'

alias brup='brew update && brew upgrade && brew cleanup'

alias gw='./gradlew'

alias serve='python3 -m http.server'

alias -g gi='grep -i'

alias sniff='sudo lsof -iTCP -sTCP:LISTEN -n -P'

alias localip='ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '\''{ print $2 }'\'''

alias restartaudio='sudo kill `ps -ax | grep coreaudiod | grep sbin | awk "{print $1}"`'

alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"

alias pgw="ping `netstat -rn -f inet | awk '$1 == "default" {print $2}' | head -1`"

alias kctx="kubectx"
alias kns="kubens"

alias mvndirs='mkdir -p src/{main,test}/{kotlin,resources}/'

alias lobby="zoom 4267640733"

alias kdr='kubectl --dry-run=client -o yaml'
