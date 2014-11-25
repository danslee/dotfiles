dotfiles
========

dot files: MacOS X but should work with Linux. bashrc, tmux, and vim stuff.

Setup should be pretty bog standard for a Terminal based MacOS X workflow. ctrl-S is used for tmux activities,
so flow control characters (ctrl-q and ctrl-s) are aggressively disabled. tmux is preferred over screen.

Setup
----

    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    $HOME/.homesick/repos/homeshick/bin/homeshick clone danslee/dotfiles

