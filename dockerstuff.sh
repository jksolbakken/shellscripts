dm-set() {
  eval "$(docker-machine env $1)"
}
