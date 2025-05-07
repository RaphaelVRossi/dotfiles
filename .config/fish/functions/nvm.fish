function nvm
    set -x current_path $(mktemp)
    bash -c "source ~/.nvm/nvm.sh --no-use; nvm $argv; dirname \$(nvm which current) >$current_path"
    fish_add_path -m $(cat $current_path)
    rm $current_path
end
