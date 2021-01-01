klogf () {
	kubectl logs -f deployment/$1 --all-containers
}
