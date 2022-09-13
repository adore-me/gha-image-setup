#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

ACTION_IMAGE_TAG=""
if [ -n "$IMAGE_TAG" ]; then
  ACTION_IMAGE_TAG="$IMAGE_TAG"
fi

if [ -n "$INPUT_TAG" ]; then
  ACTION_IMAGE_TAG="$INPUT_TAG"
fi

if [ -z "$ACTION_IMAGE_TAG" ]; then
  echo "::error::No image tag provided"
  exit 1
fi
IMAGE="$INPUT_REGISTRY/$INPUT_REPOSITORY/$INPUT_NAME:$ACTION_IMAGE_TAG"


echo -e "${BL}Info:${NC} Set docker image to: ${GR}$IMAGE${NC}"
echo "::set-output name=image::$IMAGE"