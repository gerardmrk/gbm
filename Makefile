BIN_OUT = ./.bin
BIN_SRC = ./cmd
ARTIFACTS = ./.artifacts

GO_CMD = go
GO_GET = $(GO_CMD) get
GO_TEST = $(GO_CMD) test
GO_TOOL = $(GO_CMD) tool

all: bench graph

bench: bench-sbuilder

graph: graph-mem-sbuilder graph-cpu-sbuilder

bench-sbuilder:
	$(GO_TEST) ./sbuilder/... \
		-bench=. \
		-o $(ARTIFACTS)/sbuilder.test \
		-memprofile $(ARTIFACTS)/sbuilder_mem.prof \
		-cpuprofile $(ARTIFACTS)/sbuilder_cpu.prof

graph-mem-sbuilder:
	$(GO_TOOL) pprof \
		-svg $(ARTIFACTS)/sbuilder_mem.prof \
		> $(ARTIFACTS)/sbuilder_mem.svg && \
	$(GO_TOOL) pprof \
		-pdf $(ARTIFACTS)/sbuilder_mem.prof \
		> $(ARTIFACTS)/sbuilder_mem.pdf

graph-cpu-sbuilder:
	$(GO_TOOL) pprof \
		-svg $(ARTIFACTS)/sbuilder_cpu.prof \
		> $(ARTIFACTS)/sbuilder_cpu.svg && \
	$(GO_TOOL) pprof \
		-pdf $(ARTIFACTS)/sbuilder_cpu.prof \
		> $(ARTIFACTS)/sbuilder_cpu.pdf


