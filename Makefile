CPPFILES ?= $(shell find . -type d \( -path ./externals -o -path ./build \) -prune -false -o -name "*.cpp")

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: ci-test
ci-test: ## run ci test
	cd examples/gtest && make ci-test
