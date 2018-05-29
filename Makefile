DOCKER=docker
REPOSITORY=dpsenner/cakebuild

default: build-all

build-all: build-dotnet-sdk-2.1.4

push-all: push-dotnet-sdk-2.1.4

run-all: run-dotnet-sdk-2.1.4

build-dotnet-sdk-2.1.4:
	$(DOCKER) build -t $(REPOSITORY):dotnet-sdk-2.1.4 flavors/dotnet-sdk/2.1.4

run-dotnet-sdk-2.1.4: run-dotnet-sdk-2.1.4-Default run-dotnet-sdk-2.1.4-Hello-World

run-dotnet-sdk-2.1.4-Default: build-dotnet-sdk-2.1.4
	$(DOCKER) run --rm -v $(shell pwd)/test/workspace:/workspace -w /workspace $(REPOSITORY):dotnet-sdk-2.1.4

run-dotnet-sdk-2.1.4-Hello-World: build-dotnet-sdk-2.1.4
	$(DOCKER) run --rm -v $(shell pwd)/test/workspace:/workspace -w /workspace $(REPOSITORY):dotnet-sdk-2.1.4 --target=Hello-World

push-dotnet-sdk-2.1.4: run-dotnet-sdk-2.1.4
	$(DOCKER) push $(REPOSITORY):dotnet-sdk-2.1.4
