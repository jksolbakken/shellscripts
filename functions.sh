klogfall () {
	kubectl logs -f deployment/$1 --all-containers
}

klogfapp () {
	kubectl logs -f deployment/$1 -c $1
}

sha256verify() {
    echo "$1 $2" | sha256sum --check
}

sha384verify() {
    echo "$1 $2" | sha384sum --check
}

sha512verify() {
    echo "$1 $2" | sha512sum --check
}
