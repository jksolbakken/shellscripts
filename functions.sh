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

goGo() {
    name=$1
    dirname=${name#*/}
    basename=${name##*/}
    set -x
    cd ~/dev
    mkdir -p ${dirname}
    cd ${dirname}
    mkdir -p cmd/${basename}
    mkdir pkg/
    go mod init ${name}
    git init
    echo "# ${basename}" > README.md
    echo "package main" > cmd/${basename}/main.go
    echo "${basename}:\n\tgo build -o bin/${basename} cmd/${basename}/*.go\n" > Makefile
    git add .
    git commit -a -m "initial commit"
}

ppgrep() { 
    pgrep "$@" | xargs ps -fp 2> /dev/null; 
}

function killport() { 
	lsof -i:$1 -tl | xargs kill 
}
