BIN_OUT = ./.bin
BIN_SRC = ./cmd

BIN_PREFIX_MACOS = _mac
BIN_PREFIX_LINUX = _linux
BIN_PREFIX_WINDOWS = _windows

GO_CMD = go
GO_GET = $(GO_CMD) get
GO_TEST = $(GO_CMD) test
GO_BUILD = $(GO_CMD) build
GO_CLEAN = $(GO_CMD) clean

GO_BUILD_FLAGS = -s -w
GO_BUILD_TAGS = x

all: test build

test:
	$(GO_TEST) -v ./...

clean:
	$(GO_CLEAN)
	find $(BIN_OUT) -name "*" -type f -delete

build: build-authctl build-userctl

build-authctl: build-mac-authctl build-linux-authctl build-windows-authctl

build-userctl: build-mac-userctl build-linux-userctl build-windows-userctl

build-mac-authctl:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/authctl$(BIN_PREFIX_MACOS) \
		$(BIN_SRC)/authctl

build-linux-authctl:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/authctl$(BIN_PREFIX_LINUX) \
		$(BIN_SRC)/authctl

build-windows-authctl:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/authctl$(BIN_PREFIX_WINDOWS) \
		$(BIN_SRC)/authctl

build-mac-userctl:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/userctl$(BIN_PREFIX_MACOS) \
		$(BIN_SRC)/userctl

build-linux-userctl:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/userctl$(BIN_PREFIX_LINUX) \
		$(BIN_SRC)/userctl

build-windows-userctl:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GO_BUILD) \
		-v \
		-tags "$(GO_BUILD_TAGS)" \
		-ldflags "$(GO_BUILD_FLAGS)" \
		-o $(BIN_OUT)/userctl$(BIN_PREFIX_WINDOWS) \
		$(BIN_SRC)/userctl

