#!/bin/sh
# Symlink the dotfiles into $HOME.
# Never overwrites: an existing file that is not already the intended link
# is reported as a conflict and left untouched, and the exit status is 1.

set -eu

dotfiles=$(cd "$(dirname "$0")" && pwd)
status=0

link() {
    src=$dotfiles/$1 dst=$HOME/$2
    if [ "$dst" -ef "$src" ]; then
        echo "ok       $dst"
    elif [ -e "$dst" ] || [ -L "$dst" ]; then
        echo "conflict $dst exists and is not a link to $src" >&2
        status=1
    else
        mkdir -p "$(dirname "$dst")"
        ln -s "$src" "$dst"
        echo "linked   $dst -> $src"
    fi
}

# A config file at a legacy location still takes effect; how it combines with
# the linked one differs per program.
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
link AGENTS.md              .claude/CLAUDE.md
link AGENTS.md              .codex/AGENTS.md
link .codex/pyink-sandbox.config.toml .codex/pyink-sandbox.config.toml
link skills/final-review    .codex/skills/final-review
link skills/write-pr        .codex/skills/write-pr

stale .tmux.conf 'tmux loads it too, so it applies where .config/tmux/tmux.conf is silent'
stale .gitconfig 'git reads it and ignores .config/git/config entirely'

exit $status
