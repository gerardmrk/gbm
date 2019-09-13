BIN_OUT = ./.bin
BIN_SRC = ./cmd

GO_CMD = go
GO_GET = $(GO_CMD) get
GO_TEST = $(GO_CMD) test

all: bench

bench: bench-sbuilder

bench-sbuilder:
	$(GO_TEST) -run=sbuilder -bench=. -cpuprofile profile_cpu.out
