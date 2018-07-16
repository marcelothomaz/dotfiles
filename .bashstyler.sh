#!/bin/bash

# TODO: Currently, this is hardcoded. Ideally, this should be rewritten to be configurable.

function ps1_powerline {
  RETCODE=$? # save return code
  GIT_BRANCH=$(__git_ps1)

  local GREY="\[\e[48;5;240m\]\[\e[38;5;250m\]"
  local GREY_END="\[\e[48;2;38;176;215m\]\[\e[38;5;240m\]"

  local GREEN="\[\e[48;5;2m\]\[\e[38;5;255m\]"
  local GREEN_END="\[\e[48;5;27m\]\[\e[38;5;2m\]"

  local ORANGE="\[\e[48;5;208m\]\[\e[38;5;0m\]"
  local ORANGE_END="\[\e[48;5;236m\]\[\e[38;5;208m\]"
  local ORANGE_RET_END="\[\e[48;5;160m\]\[\e[38;5;208m\]" # when next segment is prompt with return code

  local BLUE="\[\e[48;2;38;176;215m\]\[\e[38;5;0m\]"
  local BLUE_END="\[\e[48;5;208m\]\[\e[38;2;38;176;215m\]"           # when next segment is git
  local BLUE_END_JOBS="\[\e[48;5;93m\]\[\e[38;5;27m\]"       # when next segment is jobs
  local BLUE_END_ALT="\[\e[48;5;236m\]\[\e[38;2;38;176;215m\]"       # when next segment is prompt
  local BLUE_END_RET="\[\e[48;5;160m\]\[\e[38;2;38;176;215m\]"       # when next segment is prompt with return code

  local JOBS="\[\e[48;5;93m\]\[\e[38;5;255m\] ⏎"
  local JOBS_END="\[\e[48;5;236m\]\[\e[38;5;93m\]"           # when next segment is prompt
  local JOBS_NO_RET_END="\[\e[48;5;208m\]\[\e[38;5;93m\]"    # when next segment is git
  local JOBS_NO_GIT_END="\[\e[48;5;160m\]\[\e[38;5;93m\]"    # when next segment is prompt with return code

  local RET="\[\e[48;5;160m\]\[\e[38;5;255m\]"
  local RET_END="\[\e[0m\]\[\e[38;5;160m\]\[\e[0m\] "

  local PROMPT="\[\e[48;5;236m\]\[\e[38;5;255m\]"
  local PROMPT_END="\[\e[0m\]\[\e[38;5;236m\]\[\e[0m\] "

  if [ ! -w "$PWD" ]; then
    # Current directory is not writable
    BLUE_END="\[\e[48;5;160m\]\[\e[38;5;27m\]\[\e[38;5;255m\]  \[\e[48;5;208m\]\[\e[38;5;160m\]"
    BLUE_END_JOBS="\[\e[48;5;160m\]\[\e[38;5;27m\]\[\e[38;5;255m\]  \[\e[48;5;93m\]\[\e[38;5;160m\]"
    BLUE_END_ALT="\[\e[48;5;160m\]\[\e[38;5;27m\]\[\e[38;5;255m\]  \[\e[48;5;236m\]\[\e[38;5;160m\]"
    BLUE_END_RET="\[\e[48;5;160m\]\[\e[38;5;27m\]\[\e[38;5;255m\]  "
  fi

  if [ -z "$GIT_BRANCH" ]; then
    # Is not a git repo
    if [ "$RETCODE" -eq 0 ]; then
        # No jobs or ret code
        PS1="$GREY \t $GREY_END$BLUE \W $BLUE_END_ALT$PROMPT \$ $PROMPT_END"
    else
        # No jobs but ret code is there
        PS1="$GREY \t $GREY_END$BLUE \W $BLUE_END_RET$RET \$ ⚑ $RETCODE $RET_END"
    fi
  else
    # Is a git repo
    local NUM_MODIFIED=$(git diff --name-only --diff-filter=M | wc -l)
    local NUM_STAGED=$(git diff --staged --name-only --diff-filter=AM | wc -l)
    local NUM_CONFLICT=$(git diff --name-only --diff-filter=U | wc -l)
    local GIT_STATUS="\[\e[48;5;255m\]\[\e[38;5;208m\] $NUM_MODIFIED/$NUM_STAGED/$NUM_CONFLICT "
    if [ "$RETCODE" -eq 0 ]; then
      GIT_STATUS+="\[\e[38;5;255m\]\[\e[48;5;236m\]"
    else
      GIT_STATUS+="\[\e[38;5;255m\]\[\e[48;5;160m\]"
    fi

    if [ "$RETCODE" -eq 0 ]; then
        PS1="$GREY \t $GREY_END$BLUE \W $BLUE_END$ORANGE $GIT_BRANCH $GIT_STATUS$PROMPT \$ $PROMPT_END"
    else
        PS1="$GREY \t $GREY_EN$BLUE \W $BLUE_END$ORANGE $GIT_BRANCH $GIT_STATUS$RET \$ ⚑ $RETCODE $RET_END"
    fi
  fi
}

trap 'echo -ne "\033]0;${BASH_COMMAND%% *}\007"' DEBUG
function show_name { 
   if [[ -n "$BASH_COMMAND"  ]]; then
      echo -en "\033]0;`basename ${PWD}`\007"
   fi 
}

if [  "$TERM" != "linux" ]; then
   PROMPT_COMMAND="ps1_powerline; show_name; $PROMPT_COMMAND"
fi
