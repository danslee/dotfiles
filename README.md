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

Notes
----

I use Ctrl-S for tmux control because it is relatively unused and S is for
Screen.. So far, tmux is working well for me, but I switch to using
[Byobu](http://byobu.co) if I run into things I really want that don't exist in
tmux right now. But for now, it would be just another layer to update and keep
updated so I'm sticking to tmux for now.



