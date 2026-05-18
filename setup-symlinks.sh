#!/usr/bin/env bash
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_PATH="$HOME/.config"
HOME_DOTFILES="$DOTFILES/home"

# Allows the git hooks to run on pull for this repo going forward.
git -C "$DOTFILES" config core.hooksPath .githooks

SKIP_DIRS="home .git"

setup_config_link() {
  local name="$1"
  local src="$DOTFILES/$name"
  local dest="$CONFIG_PATH/$name"

  if [[ -L "$dest" ]]; then
    if [[ "$(realpath "$dest")" == "$(realpath "$src")" ]]; then
      return 0
    fi
    rm -f "$dest"
  fi

  if [[ -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      mv "$dest" "$src"
    else
      rm -rf "$dest"
    fi
  fi

  if [[ ! -e "$dest" ]] && [[ -e "$src" ]]; then
    ln -s "$src" "$dest"
    echo "setup-symlinks: linked $dest -> $src"
  elif [[ ! -e "$dest" ]] && [[ ! -e "$src" ]]; then
    echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
  fi
}

mkdir -p "$CONFIG_PATH"

for dir in "$DOTFILES"/*/; do
  name="$(basename "$dir")"
  skip=false
  for s in $SKIP_DIRS; do
    [[ "$name" == "$s" ]] && skip=true && break
  done
  $skip && continue
  setup_config_link "$name"
done

setup_home_link() {
  local name="$1"
  local src="$HOME_DOTFILES/$name"
  local dest="$HOME/$name"

  if [[ -L "$dest" ]]; then
    if [[ "$(realpath "$dest")" == "$(realpath "$src")" ]]; then
      return 0
    fi
    rm -f "$dest"
  fi

  if [[ -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      mv "$dest" "$src"
    else
      rm -rf "$dest"
    fi
  fi

  if [[ ! -e "$dest" ]] && [[ -e "$src" ]]; then
    ln -s "$src" "$dest"
    echo "setup-symlinks: linked $dest -> $src"
  elif [[ ! -e "$dest" ]] && [[ ! -e "$src" ]]; then
    echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
  fi
}

if [[ -d "$HOME_DOTFILES" ]]; then
  for file in "$HOME_DOTFILES"/.*; do
    name="$(basename "$file")"
    [[ "$name" == "." || "$name" == ".." ]] && continue
    setup_home_link "$name"
  done
fi
