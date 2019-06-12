#!/bin/bash

set -euo pipefail

command_exists() {
	command -v "$1"
}

test_run () {
  zsh -c "source $HOME/.zshrc; $1" >/dev/null || (echo "Command $1 failed" && exit 1)
}

test_existence () {
  command_exists "$1" >/dev/null || (echo "Command $1 failed" && exit 1)
}

test_existence zsh

test_run "git --version"
test_run "curl --version"
test_run "wget --version"
test_run "cmake --version"
test_run "make --version"
test_run "python2 --version 2>&1"
test_run "python3 --version"
test_run "git-cola --version"
test_run "firefox --version"
test_run "jq --version"
test_run "htop --version"
test_run "liferea --version"
test_run "sbt sbtVersion"
test_run "tmux -V"
# Running tilix --version fails when no display
test_existence tilix
test_run "ag --version"
test_run "psql --version"
test_run "docker --version"
test_run "shellcheck --version"
test_run "nvim --version"
test_run "cargo --version"
test_run "zsh --version"
test_run "java --version"
test_run "tig --version"
# FIXME
# test_existence z
test_run "nvm --version"
test_existence "postman"
test_run "code --version"
test_existence "dbeaver"
