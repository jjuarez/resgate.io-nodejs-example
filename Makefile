#!/usr/bin/env make

CONFIG ?= .envrc

-include $(CONFIG)

APP_NAME ?= app.js

.DEFAULT_GOAL := help


.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: clean
clean:
	@rm -fr node_modules 2>/dev/null


.PHONY: build
build:
	@npm install --only-production


.PHONY: docker-build
docker-build:
	@docker build -t jjuarez/resgate.io-nodejs-example:latest -f Dockerfile .


.PHONY: start 
start:  build  ## Start all the stuff NATS.io server and resgate API gateway
	@node $(APP_NAME)

