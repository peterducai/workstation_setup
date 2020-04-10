# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:/home/$USER/go/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# GIT update/pull all repos in directory
alias gitupall='ls | xargs -I{} git -C {} pull'
alias gitshowurl='find . -type d -exec sh -c ''cd "{}"; git config --get remote.origin.url\'' \; -prune -print'
alias gitshowurls='ls | xargs -I{} git -C {} config --get remote.origin.url'