# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set editors
export EDITOR=vim
export GIT_EDITOR=vim

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Add colors to various things
export CLICOLOR=1
if [ `uname` == "Darwin" ]; then
    export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
    export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
    export LC_CTYPE=en_US.utf-8
    export LC_ALL=en_US.utf-8
else
    alias ls='ls --color=auto'
    export GREP_COLORS='1;32'

    # GREP_OPTIONS is deprecated - use aliases instead.
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Fix path so it picks up Homebrew and stuff in the home directory.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:~/.bin:$PATH

# Ignore Ctrl-D once before logging out.
export IGNOREEOF=1

# Tell Python to not write .pyc files
export PYTHONDONTWRITEBYTECODE=1

# Default options for less(1)
export LESS="-FRSX"

# Make less more friendly for non-text input files; see lesspipe(1)
for path in "/usr/local/bin/lesspipe" "/usr/local/bin/lesspipe.sh" "/usr/bin/lesspipe"; do
    [ -x $path ] && eval "$(SHELL=/bin/sh $path)"
done

# Handy aliases.
alias ..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Load any third-party completion files.
if [ -f /usr/local/git/contrib/completion ]; then
    . /usr/local/git/contrib/completion/git-completion.bash
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Set prompt.
export PS1="\[\033[38;5;196m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] at \[$(tput sgr0)\]\[\033[38;5;208m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;5m\]\\$\[$(tput sgr0)\] "

# Load any user-local bash configuration.
if [ -f ~/.bash.local ]; then
    source ~/.bash.local
fi
