# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#don't logout on ctrl-d. DOH!
export IGNOREEOF=3
#export LESS="-X -z-3"

if [ -n "`which bash | grep -v ' not '`" ]; then
	export SHELL=`type -p bash`;
fi

#if type -p vim > /dev/null; then
#   if type -a vim > /dev/null; then
#      vimcommand=`alias vim | cut -f 2 -d "'"`;
#   else
#      vimcommand=`type -p vim | cut -f 3 -d " "`;
#   fi
#   export editor=$vimcommand
#else
#   export editor=`type -p vi | cut -f 3 -d " "`;
#fi

case $TERM in
    xterm*)
	PS1="\[\033]0;\u@\h: \w\007\033[7m\][\u@\h \W]\[\033[m\] "
	;;
    *)
	PS1="\[\033[7m\][\u@\h \W]\[\033[m\] "
	;;
esac

unset VISUAL
if ( type tabs > /dev/null 2>&1 ); then
	tabs -4 2> /dev/null
fi


# PATH functions
# general purpose would take newdir, olddirs, env_name
function has_dir()
{
  echo $PATH | sed -e 's/:/\
/g' | fgrep -q "^$1$"
}

function remove_dir()
{
  export PATH=$(echo $PATH | sed -e 's/:/\
/g' | grep -v "^$1$"| tr '\n' ':' | sed -e 's/:$//')
}


function add_front()
{
  if [ -d "$1" ]; then
    remove_dir "$1"
    export PATH="$1:$PATH"
  fi
}

function add_back()
{
  if [ -d "$1" ]; then
    remove_dir "$1"
    export PATH="$PATH:$1"
  fi
}

# brew modification
add_front /usr/local/sbin
add_front /usr/local/bin
add_front ${HOME}/bin
add_front /opt/homebrew/bin
add_front "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if [ -d /usr/local/mysql ] ; then
  add_back /usr/local/mysql/bin
fi
if [ -d "$HOME/.local/bin" ]; then
  add_back "$HOME/.local/bin"
fi


export MANPATH="/opt/local/share/man:${MANPATH}"

# brew modifications
export ARCHFLAGS="-arch x86_64"

#tty settings
export BGCOL='dark'
stty oxtabs #expand tabs to spaces on output
#export LC_CTYPE=en_US.UTF-8
#export PYTHONPATH=${HOME}/lib/python:${HOME}/lib/DIP_py

if uname | grep -q Darwin ; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

#tmux helpers
# disable flow control and reclaim ^S ^Q
stty -ixon 2> /dev/null
stty stop undef 2> /dev/null
stty start undef 2> /dev/null
bind -r "\C-s" 2> /dev/null

# Load up other .sh files
# Doing find | while read instead of the for loop doesn't work because the pipe
# creates a new subshell whose modified environment becomes unlinked when it is
# destroyed. I think I've stumbled on that pipe -> subshell behavior a few
# times but it never seems to stick.
# find $HOME -maxdepth 1 -type f -name ".*[_-]sh" -print | while read f; do
for i in ${HOME}/.*[_-]sh ; do
  . $i
done
tput init

# homeshick!
source $HOME/.homesick/repos/homeshick/homeshick.sh

#eval "$(pyenv init -)"
#. "$HOME/.cargo/env"


# nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
source $(brew --prefix nvm)/nvm.sh

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
