
# Powerline shell changes
if [ -d "$HOME/.local/bin" ] ; then PATH="$HOME/.local/bin:$PATH"; fi
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/opt/bin" ] ; then
    PATH="$HOME/opt/bin:$PATH"
fi

# Info file
id=$(hostname | awk -F. '{print $2}')
if [ `command -v facter` ]; then
  ip=$(facter ipaddress)
fi
echo "|$id|$ip" > ~/.info
# SSH BANNER -------------------------
rm ~/.motd
owner="wenlock"
owner=$(printf '%-40s' $owner)
host=$(hostname | awk -F. '{print $1"."$2}')
host=$(printf '%10s' $host)
echo -e "\033[1;37m┌─────────────────────────────────────────────────────────────┐" > ~/.motd
echo -e "\033[1;37m│ \033[01;31m$host \033[01;32mOWNED BY $owner\033[1;37m│" >> ~/.motd
echo -e "\033[1;37m└─────────────────────────────────────────────────────────────┘\033[00m" >> ~/.motd
cat ~/.motd

if [ -f /etc/environment ] ; then
  . /etc/environment
fi