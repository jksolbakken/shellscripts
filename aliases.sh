alias tot='du -cksh'

alias rmdocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

alias weather='curl wttr.in/Oslo'
