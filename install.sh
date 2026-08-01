#!/bin/sh
# Symlink the dotfiles into $HOME.
# Never overwrites: an existing file that is not already the intended link
# is reported as a conflict and left untouched, and the exit status is 1.

set -eu

dotfiles=$(cd "$(dirname "$0")" && pwd)
status=0

link() {
    src=$dotfiles/$1 dst=$HOME/$2
    if [ "$(readlink -f "$dst" 2>/dev/null)" = "$(readlink -f "$src")" ]; then
        echo "ok       $dst"
    elif [ -e "$dst" ] || [ -L "$dst" ]; then
        echo "conflict $dst exists and is not a link to $src" >&2
        status=1
    else
        mkdir -p "$(dirname "$dst")"
        ln -sr "$src" "$dst"
        echo "linked   $dst -> $src"
    fi
}

# A config file at a legacy location takes precedence over the linked one.
stale() {
    if [ -e "$HOME/$1" ] || [ -L "$HOME/$1" ]; then
        echo "stale    $HOME/$1 exists; $2" >&2
        status=1
    fi
}

link .vimrc                 .vimrc
link .screenrc              .screenrc
link .config/git/config     .config/git/config
link .config/tmux/tmux.conf .config/tmux/tmux.conf
link ipython_config.py      .ipython/profile_default/ipython_config.py

stale .tmux.conf 'tmux reads it instead of .config/tmux/tmux.conf'
stale .gitconfig 'its values override .config/git/config'

exit $status
