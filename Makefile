.DEFAULT_GOAL=build

BINDIR      := $(CURDIR)/bin
BINNAME     ?= picker

# go option
PKG         := ./...
BOOTSTRAP   := ./cmd/picker/root.go

fmt:
	go fmt $(PKG)
.PHONY:fmt

lint:fmt
	golint $(PKG)
.PHONY:lint

vet:fmt
	go vet $(PKG)
.PHONY:vet

build:vet
	go build -o '${BINDIR}/${BINNAME}' $(BOOTSTRAP)
.PHONY:build
