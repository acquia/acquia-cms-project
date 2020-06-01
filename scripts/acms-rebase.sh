#!/usr/bin/env bash

#-------------------------- Helper functions -----------------------------

# Console colors
red='\033[0;31m'
green='\033[0;32m'
green_bg='\033[42m'
yellow='\033[1;33m'
NC='\033[0m'

echo-red () { echo -e "${red}$1${NC}"; }
echo-green () { echo -e "${green}$1${NC}"; }
echo-green-bg () { echo -e "${green_bg}$1${NC}"; }
echo-yellow () { echo -e "${yellow}$1${NC}"; }

#-------------------------- END: Helper functions ------------------------

echo -e "${green}Fetching ACMS repository updates...${NC}"
cd upstreams/acquia_cms
git fetch origin

if [ -z "$(git status --porcelain)" ]; then
  echo -e "${green}Rebasing against origin/develop...${NC}"
  git rebase origin/develop

  else
  echo -e "${red}Warning: uncommitted changes detected. Please commit ACMS changes before rebasing.${NC}"
fi
