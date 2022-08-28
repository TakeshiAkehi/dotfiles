PWD=$(shell pwd)
.SILENT: build

image:
	docker build -t dotfiles --force-rm -f docker/Dockerfile docker/

bash:
	docker run --rm --name dotfilesbash -v ${PWD}:/root/dotfiles -it dotfilesbash /bin/bash