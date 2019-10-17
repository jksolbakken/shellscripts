alias tot='du -cksh'

alias rmdocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

alias weather='curl wttr.in/Oslo'

alias brup='brew update && brew upgrade && brew cleanup'

alias gw='./gradlew'

alias serve='python3 -m http.server'

alias -g gi='grep -i'

alias k="kubectl"

alias sniff='sudo lsof -iTCP -sTCP:LISTEN -n -P'

alias myip='ifconfig | grep "inet " | grep -Fv 127.0.0.1'

alias restartaudio='sudo kill `ps -ax | grep coreaudiod | grep sbin | awk "{print $1}"`'

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias proxcurl='HTTPS_PROXY="socks5://localhost:14122" curl'

alias proxgradle=gradle "-DsocksNonProxyHosts=*.confluent.io|*.apache.org|*.bintray.com|repo.jfrog.org|*.bintray.com|*.cloudfront.net" -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=14122

alias pods='{ name=$(cat -); kubectl get pods -lapp=$name; }<<<'

alias ings='{ name=$(cat -); kubectl get ing -lapp=$name; }<<<'
