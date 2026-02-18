#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_profile()
{
  AWS_PROFILE="${AWS_PROFILE:-$(${AWS_TMUX_BINARY} configure get profile 2>/dev/null)}"
  if [[ $AWS_PROFILE == "" ]]; then
    printf "default"
  else
    printf "$AWS_PROFILE"
  fi
}
get_profile
