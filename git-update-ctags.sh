#!/usr/bin/env sh
set -e
# PATH="/usr/local/bin:$PATH"
dir="`git rev-parse --git-dir`"
trap 'rm -f "$dir/$$.tags"' EXIT
git ls-files | \
    ctags --tag-relative -L - -f"$dir/$$.tags" \
        --languages=C,C++,Perl,Python,Vim
mv "$dir/$$.tags" "$dir/tags"

# http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
