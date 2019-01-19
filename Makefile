.PHONY: build
build:
	docker build . -t docker.io/johnarok/swissknife:latest

.PHONY: push
push:
	docker push docker.io/johnarok/swissknife:latest

