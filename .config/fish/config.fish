if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Load MacOS Homebrew
if command -q /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

if command -q /opt/homebrew/bin/pyenv
  set -Ux PYENV_ROOT $HOME/.pyenv
  fish_add_path $PYENV_ROOT/bin
  pyenv init - fish | source
end

if command -q /opt/homebrew/bin/pipx
  fish_add_path $HOME/.local/bin
end

if command -q /opt/homebrew/bin/nvm
  set -Ux NVM_DIR $HOME/.nvm
  auto_load_nvm
end

# Set GoLang Envvar
if command -q $(which go)
  export GOPATH="$HOME/go"
  fish_add_path $GOPATH/bin
  fish_add_path /usr/local/bin/go
end

# nvim to vi
if command -q $(which nvim)
  alias vi='nvim'
end

# kitty to icat
if command -q $(which kitty)
  alias icat='kitty +kitten icat'
end

# nproc
alias nproc='sysctl -n hw.logicalcpu'

# Created by `pipx` on 2025-04-01 02:17:05
set PATH $PATH /Users/raphael.rossi/.local/bin
