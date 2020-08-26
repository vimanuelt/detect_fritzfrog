# detect_fritzfrog
This repository contains a detection tool for the [FritzFrog campaign](https://www.guardicore.com/2020/08/fritzfrog-p2p-botnet-infects-ssh-servers/).

## Detection Script for GhostBSD - *detect_fritzfrog.sh*
### Running the Script
Open a terminal and run
```
./detect_fritzfrog.sh
```
The script detects checks whether:
1. a fileless process named _nginx / ifconfig / libexec / php-fpm_ is running
2. port 1234 is listening

If two of these conditions hold, there's a high chance the machine is infected.

```
ghostbsd@ip-111-11-11-11:~$ ./detect_fritzfrog.sh
FritzFrog Detection Script by Guardicore Labs
=============================================

[*] Fileless process nginx is running on the server.
[*] Listening on port 1234
[*] High chances FritzFrog is running on this machine.
```

In such case, you should:
* kill the malicious processes
* block traffic on ports 1234 (P2P communication) and 5555 (cryptominer)
* block traffic to domain `xmrpool.eu`

You are welcome to [contact Guardicore](mailto:labs@guardicore.com) for assistance with mitigating the threat.

### References 
(1) https://www.guardicore.com/2020/08/fritzfrog-p2p-botnet-infects-ssh-servers/
(2) https://github.com/guardicore/labs_campaigns/tree/master/FritzFrog
