.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: attach
attach: ## add release worktree
	git worktree add ./release release

.PHONY: detach
detach: ## remove release worktree
	git worktree remove ./release

.PHONY: release
release: ## release process
	yarn --silent info ameba-color-palette.css versions | tr "'" '"' | jq -r .[] | xargs -n 1 ./index.sh
