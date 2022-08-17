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

killport() { 
	lsof -i:$1 -tl | xargs kill 
}

zoom() { 
	open "zoommtg://zoom.us/join?confno=$1" 
}

jwt() { 
	echo -n $1 | jc --jwt | jq 
}

hedo() {
    adam=$(id | grep -o "80(admin)")
    if [[ "$adam" != "" ]]; then
        echo "I Have The Power"
    else
        echo "By The Power Of Greyskull"
        /Applications/Privileges.app/Contents/Resources/PrivilegesCLI --add
        echo "I Have The Power"
    fi
}


hedont() {
    /Applications/Privileges.app/Contents/Resources/PrivilegesCLI --remove
    echo "Power gone..."
}
