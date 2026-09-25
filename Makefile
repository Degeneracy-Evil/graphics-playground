CARGO ?= cargo

.PHONY: all build run release check fmt clean

all: build

build:
	$(CARGO) build

run:
	$(CARGO) run

release:
	$(CARGO) build --release

check:
	$(CARGO) check

fmt:
	$(CARGO) fmt

clean:
	$(CARGO) clean
