#!/bin/sh

set -exu

repo_dir=$HOME"/repo/"

for f in $repo_dir"dotfiles/".??*; do
    [ -d "$f" ] && continue

    rm -rf $HOME"/"`basename "$f"`
done
