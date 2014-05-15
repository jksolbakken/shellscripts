function tarbomb(){ 
   [[ $( tar tf "$1" |sed 's,^\./,,' |awk -F/ '{print $1}' |sort |uniq |wc -l ) -eq 1 ]]  && echo "OK" || echo 'Tarbomb!'; 
}
