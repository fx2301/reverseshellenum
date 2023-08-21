# Overview

Enumerates reverse shells from [reveshells.com](https://www.revshells.com/). Great for defensive auditing. Great for lazy offense. Bad for stealth.

# Usage

## On the server

```bash
LHOST="10.10.0.123" LPORT="31373" python3 generate.py # embeds LHOST and LPORT in reverseshellenum.sh
./listen.sh
```

## On the client

```bash
./reverseshellenum.sh
```

Note that if you didn't generate the script in the previous section then this will connect to 127.0.0.1:31373.

# Example output

```bash
$ ./listen.sh
[i] Starting Reverse Shell Audit
  [+] Success: Bash -i
  [+] Success: Bash 196
  [+] Success: Bash read line
  [+] Success: Bash 5
  [+] Success: ncat -e
  [+] Success: Perl
  [+] Success: Perl no sh
  [+] Success: PHP Emoji
[i] Ending Reverse Shell Audit
```

## Update reverse shells

TODO: Fix parsing failure around line 98 of source data (remove `head -n 95` work-around):
```bash
curl -sL https://raw.githubusercontent.com/0dayCTF/reverse-shell-generator/main/js/data.js | grep -v msfvenom | grep -A 1 -B 3 linux | grep -vE '^--$' | sed 's/^\s*\},/}/' | head -n 95 | jq -s . > shells.json
```