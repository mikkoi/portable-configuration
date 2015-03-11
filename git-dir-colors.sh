#/!/usr/bin/env bash

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[1;37m\]"
UNDERLINE="\[\033[4m\]"
NO_COLOUR="\[\033[0m\]"

export PROMPT_COMMAND='RET=$?;\
   BRANCH="";\
   ERRMSG="";\
   if [[ $RET != 0 ]]; then\
      ERRMSG=" ($RET)";\
   fi;\
   if git branch 2>/dev/null 1>/dev/null; then\
      BRANCH="[$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2)]";\
   fi;
   PS1="$GREEN\u@\h $BLUE\w $CYAN$BRANCH$RED$ERRMSG \$ $BLACK";'

