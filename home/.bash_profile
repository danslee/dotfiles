if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
. "$HOME/.cargo/env"

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
