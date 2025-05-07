function auto_load_nvm --on-variable PWD
  set -l nvmrc_path $(pwd)/.nvmrc
  if test -e $nvmrc_path
    set -l nvmrc_node_version $(nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install $(cat $nvmrc_path)
    else if test "$nvmrc_node_version" != "$node_version"
      nvm use $nvmrc_node_version
    end
  end
end
