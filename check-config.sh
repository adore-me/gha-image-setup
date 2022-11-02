#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

if [ -n "$INPUT_TAG" ]; then
  echo -e "${BL}Info:${NC} Tag found in input. Using ${GR}$INPUT_TAG${NC}"

  echo "get-tag-from-config=false" >> "$GITHUB_OUTPUT"

  exit 0
fi

echo -e "${BL}Info:${NC} Checking for project config file..."
if [ ! -f "$INPUT_CONFIG_LOCATION" ]; then
  errorMessage="./ci/config.yaml file not found! Please commit your $INPUT_CONFIG_LOCATION file to your repository."
  echo "::error::$errorMessage"
  exit 1
else
  echo -e "${BL}Info:${NC} Config file found! All good..."
fi

echo "get-tag-from-config=true" >> "$GITHUB_OUTPUT"