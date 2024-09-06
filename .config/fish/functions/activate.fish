function activate --description "Activate virtual env on fish"
	pdm use -i .venv
	set PATH (pwd)/.venv/bin $PATH
end
