#!/bin/sh

echo 'FritzFrog Detection Script by Guardicore Labs'
echo 'Adapted to GhostBSD by Vester Thacker'
echo ''

proc_names='nginx ifconfig libexec php-fpm'
malicious_proc=false
listening_port=false

for pn in $proc_names
do
#    ls -l /proc/$(pidof $pn)/exe 2>/dev/null | grep -q deleted && {
    ls -l /proc/$(pgrep $pn)/file 2>/dev/null | grep -q deleted && {
        malicious_proc=true
        echo "[*] Fileless process $pn is running on the server."
    }
done

# netstat -lno | grep -wq 1234 && {
netstat -l | grep -wq 1234 && {
    listening_port=true
    echo '[*] Listening on port 1234'
}

if $malicious_proc || $listening_port; then
    echo "[*] There is evidence of FritzFrog's malicious activity on this machine."
    exit 1
else
    echo '[*] The machine seems clean.'
    exit 0
fi
