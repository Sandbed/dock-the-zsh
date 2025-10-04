#!/bin/bash
echo "Hello from macOS"

# macOS zsh-compatible
if [[ "$SHELL" == *"zsh"* ]]; then
  echo "Running in zsh!"
else
  echo "Running in bash!"
fi

echo "dock-the-zsh ready! 🍎"
