PWD=$(shell pwd)
.SILENT: build

image:
	docker build -t dotfiles --force-rm -f docker/Dockerfile docker/

bashv:
	docker run --rm --name dotfiles -v ${PWD}:/root/dotfiles -it dotfiles /bin/bash

bash:
	docker run --rm --name dotfiles -it dotfiles /bin/bash