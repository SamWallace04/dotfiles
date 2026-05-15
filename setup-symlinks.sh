#!/usr/bin/env bash
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_PATH="$HOME/.config"
HOME_DOTFILES="$DOTFILES/home"

setup_config_link() {
  local name="$1"
  local src="$DOTFILES/$name"
  local dest="$CONFIG_PATH/$name"

  if [[ -L "$dest" ]]; then
    if [[ "$(realpath "$dest")" == "$(realpath "$src")" ]]; then
      return 0
    fi
    echo "setup-symlinks: skipping ${name}: $dest is already a symlink elsewhere" >&2
    return 0
  fi

  if [[ -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      mv "$dest" "$src"
    else
      echo "setup-symlinks: skipping ${name}: both $dest and $src exist" >&2
      return 0
    fi
  fi

  if [[ ! -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
      return 0
    fi
    ln -s "$src" "$dest"
  fi
}

for name in nvim hypr ghostty rofi waybar; do
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
    echo "setup-symlinks: skipping ${name}: $dest is already a symlink elsewhere" >&2
    return 0
  fi

  if [[ -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      mv "$dest" "$src"
    else
      echo "setup-symlinks: skipping ${name}: both $dest and $src exist" >&2
      return 0
    fi
  fi

  if [[ ! -e "$dest" ]]; then
    if [[ ! -e "$src" ]]; then
      echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
      return 0
    fi
    ln -s "$src" "$dest"
  fi
}

for name in .tmux.conf .zprofile .zshenv .zshrc; do
  setup_home_link "$name"
done
