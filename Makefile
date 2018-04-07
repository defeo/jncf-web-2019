build: node_modules/.installed
	node config.js

install: node_modules/.installed

watch:
	while inotifywait -e close_write,moved_to,create -r .; do make build; done

node_modules/.installed: package.json
	npm install
	touch node_modules/.installed

.PHONY: build install watch
