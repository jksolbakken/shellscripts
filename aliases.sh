alias tot='du -cksh'

alias rmdocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

alias weather='curl wttr.in/Oslo'

alias brup='brew update && brew upgrade && brew cleanup'

alias gw='./gradlew'

alias serve='python3 -m http.server'

alias -g gi='grep -i'
