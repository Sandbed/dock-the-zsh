#!/bin/bash

# Language-specific config (uses global vars)
LANGUAGE_NAME="Go"
BASE_IMAGE=${BASE_IMAGE:-"golang:1.25-bookworm"} # Fallback to default
ADDITIONAL_PACKAGES=""
ZSH_PLUGINS="$ZSH_PLUGINS golang" # Append language-specific plugins
POST_CREATE_COMMAND="go mod download"