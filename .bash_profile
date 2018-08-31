parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set terminal prompt
export PS1="\[\033[36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Set default blocksize for ls, df, du
export BLOCKSIZE=1k

# Everyday shortcuts
alias ll='ls -FGlh'                         # Preferred 'ls' behavior
alias la='ls -FGlAh'			    # ls dotfiles as well
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias fuck='sudo $(history -p \!\!)'        # Re-run last command as root

# Git shortcuts
alias gcl='git clone'
alias gs='git status'
alias ga='git add'
alias gall='git add .'
alias gc='git commit -m'
alias pull='git pull'
alias push='git push'

# Code coloring
# cl() { 
#     pygmentize -O style=monokai -f console256 -g "$1" | less -R 
# }

# Fun stuff
alias fun='fortune | cowsay | lolcat'
function funsay() {
    fortune | tee tmp | cowsay | lolcat &
    say -f tmp
    rm tmp
}

PATH="$PATH:~/Library/Python/2.7/bin"

# pyenv setup
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# python-virtualenv setup
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python'
source /usr/local/bin/virtualenvwrapper.sh

export NODE_PATH=/usr/local/lib/node_modules/

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
