# Makefile for gRPC SSO project
# Usage: make protos  (generates Go code from proto files)

# Variables
PROTO_PATH := proto
PROTO_FILE := $(PROTO_PATH)/sso/sso.proto
OUTPUT_DIR := gen/go

# Ensure output directory exists
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Generate Go and gRPC code from proto
protos: $(OUTPUT_DIR)
	protoc \
		-I $(PROTO_PATH) \
		$(PROTO_FILE) \
		--go_out=$(OUTPUT_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(OUTPUT_DIR) \
		--go-grpc_opt=paths=source_relative

# Clean generated files
clean:
	rm -rf $(OUTPUT_DIR)

# Default target
all: protos

.PHONY: protos clean all
