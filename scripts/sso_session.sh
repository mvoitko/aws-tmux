#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_sso_session()
{
  local profile="${AWS_PROFILE:-${AWS_DEFAULT_PROFILE:-default}}"
  local sso_session="$(${AWS_TMUX_BINARY} configure get sso_session --profile "$profile" 2>/dev/null)"
  if [[ $sso_session == "" ]]; then
    printf "%s" "none"
  else
    printf "%s" "$sso_session"
  fi
}
get_sso_session
