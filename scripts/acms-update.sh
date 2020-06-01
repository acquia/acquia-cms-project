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
  echo -e "${green}Resetting local ACMS state...${NC}"
  git checkout develop

  echo -e "${green}Running composer update...${NC}"
  cd ../../
  composer update acquia/acquia_cms --with-all-dependencies

  else
  echo -e "${red}Warning: uncommitted changes detected. Please commit ACMS changes before updating.${NC}"
fi
