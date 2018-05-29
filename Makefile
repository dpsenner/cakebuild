DOCKER=docker
REPOSITORY=dpsenner/cakebuild
DOCKER_RUN=$(DOCKER) run --rm -v $(shell pwd)/test/workspace:/workspace -w /workspace

default: run-all

build-all: build-dotnet-latest build-dotnet-2-sdk

push-all: push-dotnet-latest push-dotnet-2-sdk

run-all: run-dotnet-latest run-dotnet-2-sdk

build-dotnet-latest:
	$(DOCKER) build -t $(REPOSITORY):dotnet-latest flavors/dotnet/latest

run-dotnet-latest: run-dotnet-latest-Default run-dotnet-latest-Hello-World

run-dotnet-latest-Default: build-dotnet-latest
	$(DOCKER_RUN) $(REPOSITORY):dotnet-latest

run-dotnet-latest-Hello-World: build-dotnet-latest
	$(DOCKER_RUN) $(REPOSITORY):dotnet-latest --target=Hello-World

push-dotnet-latest: run-dotnet-latest
	$(DOCKER) push $(REPOSITORY):dotnet-latest

build-dotnet-2-sdk:
	$(DOCKER) build -t $(REPOSITORY):dotnet-2-sdk flavors/dotnet/2-sdk

run-dotnet-2-sdk: run-dotnet-2-sdk-Default run-dotnet-2-sdk-Hello-World

run-dotnet-2-sdk-Default: build-dotnet-2-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-2-sdk

run-dotnet-2-sdk-Hello-World: build-dotnet-2-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-2-sdk --target=Hello-World

push-dotnet-2-sdk: run-dotnet-2-sdk
	$(DOCKER) push $(REPOSITORY):dotnet-2-sdk
