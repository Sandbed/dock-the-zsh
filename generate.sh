#!/bin/bash

# Default values
USERNAME="codemaxing"
FORWARD_PORTS="[8080, 3000, 5000, 8000]"
NODE_VERSION="20.x"
ZSH_THEME="steeef"
ZSH_PLUGINS="git command-not-found zsh-interactive-cd gitfast"
NO_PROMPT=false

# Parse flags
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --username) USERNAME="$2"; shift ;;
        --ports) FORWARD_PORTS="$2"; shift ;;
        --base-image) BASE_IMAGE="$2"; shift ;;
        --node-version) NODE_VERSION="$2"; shift ;;
        --zsh-theme) ZSH_THEME="$2"; shift ;;
        --zsh-plugins) ZSH_PLUGINS="$2"; shift ;;
        --no-prompt) NO_PROMPT=true ;;
        *) echo "Error: Unknown flag $1"; exit 1 ;;
    esac
    shift
done

# Interactive prompts if not in no-prompt mode
if [ "$NO_PROMPT" = false ]; then
    read -p "? Container username [$USERNAME]: " input && USERNAME=${input:-$USERNAME}
    read -p "? Forwarded ports [$FORWARD_PORTS]: " input && FORWARD_PORTS=${input:-$FORWARD_PORTS}
fi

# Export vars for templates
export USERNAME FORWARD_PORTS NODE_VERSION ZSH_THEME ZSH_PLUGINS