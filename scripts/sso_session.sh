#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_sso_session()
{
  SSO_SESSION="$(${AWS_TMUX_BINARY} configure get sso_session 2>/dev/null)"
  if [[ $SSO_SESSION == "" ]]; then
    printf "none"
  else
    printf "$SSO_SESSION"
  fi
}
get_sso_session
