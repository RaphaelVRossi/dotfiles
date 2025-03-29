.PHONY: restore
restore:
	@echo 'restoring'
	@cat dotfiles.conf | while read name; do cp -r $${name} $${HOME}/$${name}; done

.PHONY: backup
backup:
	@echo 'backing up'
	@cat dotfiles.conf | while read name; do cp -r $${HOME}/$${name} $${name} ; done
