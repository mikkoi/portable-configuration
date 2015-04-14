#!/usr/bin/env bash

(test -r "${HOME}/other/github/git/contrib/completion/git-prompt.sh") || { git clone https://github.com/git/git "${HOME}/other/github/git"; }

# shellcheck disable=SC2034
GIT_PS1_SHOWDIRTYSTATE=1
# shellcheck disable=SC2034
GIT_PS1_SHOWSTASHSTATE=1
# shellcheck disable=SC2034
GIT_PS1_SHOWUNTRACKEDFILES=1
# shellcheck disable=SC2034
GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_DESCRIBE_STYLE=default
# GIT_PS1_SHOWCOLORHINTS=1
# GIT_PS1_HIDE_IF_PWD_IGNORED=1
# shellcheck disable=SC2034
GIT_PS1_STATESEPARATOR=" "

source "${HOME}/other/github/git/contrib/completion/git-prompt.sh"
source "${HOME}/portable-configuration/git-dir-colors.sh"

export PROMPT_COMMAND='RET=$?;
   ERRMSG="";
   if [[ $RET != 0 ]]; then
      ERRMSG="($RET)";
   fi;
   PS1="$GREEN\u@\h $BLUE\w $CYAN$(__git_ps1 "(%s)") $RED$ERRMSG \\\$${BLACK} "'

