BIN_OUT = ./.bin
BIN_SRC = ./cmd

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
		-o .artifacts/sbuilder.test \
		-memprofile .artifacts/sbuilder_mem.prof \
		-cpuprofile .artifacts/sbuilder_cpu.prof

graph-mem-sbuilder:
	$(GO_TOOL) pprof \
		-svg .artifacts/sbuilder_mem.prof \
		> .artifacts/sbuilder_mem.svg && \
	$(GO_TOOL) pprof \
		-pdf .artifacts/sbuilder_mem.prof \
		> .artifacts/sbuilder_mem.pdf

graph-cpu-sbuilder:
	$(GO_TOOL) pprof \
		-svg .artifacts/sbuilder_cpu.prof \
		> .artifacts/sbuilder_cpu.svg && \
	$(GO_TOOL) pprof \
		-pdf .artifacts/sbuilder_cpu.prof \
		> .artifacts/sbuilder_cpu.pdf


