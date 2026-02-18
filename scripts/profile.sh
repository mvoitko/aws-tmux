#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

get_profile()
{
  local profile="${AWS_PROFILE:-${AWS_DEFAULT_PROFILE:-default}}"
  printf "%s" "$profile"
}
get_profile
