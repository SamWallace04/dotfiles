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
  elif [[ ! -e "$dest" ]] && [[ ! -e "$src" ]]; then
    echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
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
  elif [[ ! -e "$dest" ]] && [[ ! -e "$src" ]]; then
    echo "setup-symlinks: skipping ${name}: $src does not exist" >&2
  fi
}

mkdir -p "$HOME_DOTFILES"

for name in .tmux.conf .zprofile .zshenv .zshrc; do
  setup_home_link "$name"
done
