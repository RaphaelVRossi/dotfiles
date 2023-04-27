if status is-interactive
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:/usr/local/bin:/usr/local/bin/go:$PATH"
    # Commands to run in interactive sessions can go here
end
eval (/opt/homebrew/bin/brew shellenv)


alias nproc="sysctl -n hw.logicalcpu"
alias icat="kitty +kitten icat"
alias vi="nvim"


# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

