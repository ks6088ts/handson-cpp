CPPFILES ?= $(shell find . -type d \( -path ./externals -o -path ./build \) -prune -false -o -name "*.cpp")

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install-deps-ubuntu
install-deps-ubuntu: ## install dependencies for ubuntu
	sudo apt install -y clang clang-format python3-pip
	pip3 install cpplint

.PHONY: format
format: ## format codes
	clang-format -i -style=file $(CPPFILES)

.PHONY: lint
lint: ## lint
	cpplint $(CPPFILES)

.PHONY: build
build: ## build
	mkdir -p build && \
	cd build && \
	cmake .. && \
	make

.PHONY: ci-test
ci-test: lint build ## run ci test
	./build/handson
