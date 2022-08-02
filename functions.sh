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

decode_base64_url() {
  local len=$((${#1} % 4))
  local result="$1"
  if [ $len -eq 2 ]; then result="$1"'=='
  elif [ $len -eq 3 ]; then result="$1"'='
  fi
  echo "$result" | tr '_-' '/+' | openssl enc -d -base64
}

decode_jwt(){
   echo -n $2 | cut -d "." -f $1 | base64 -d | jq .
}
