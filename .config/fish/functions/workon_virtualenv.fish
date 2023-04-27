function workon_virtualenv -d "Workon when cd a virtualenv folder"

    if test -d .git
        set current_dir (basename (pwd))

        if type -q deactivate
            deactivate >/dev/null 2>&1
        end
        if test -d ~/.virtualenvs/$current_dir
            source ~/.virtualenvs/$current_dir/bin/activate.fish
        end
    end
end
