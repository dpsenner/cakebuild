DOCKER=docker
REPOSITORY=dpsenner/cakebuild
DOCKER_RUN=$(DOCKER) run --rm -v $(shell pwd)/test/workspace:/workspace -w /workspace

default: run-all

build-all: build-dotnet-core-latest build-dotnet-core-2-sdk

push-all: push-dotnet-core-latest push-dotnet-core-2-sdk

run-all: run-dotnet-core-latest run-dotnet-core-2-sdk

build-dotnet-core-latest:
	$(DOCKER) build -t $(REPOSITORY):dotnet-core-latest flavors/dotnet-core/latest

run-dotnet-core-latest: run-dotnet-core-latest-Default run-dotnet-core-latest-Hello-World

run-dotnet-core-latest-Default: build-dotnet-core-latest
	$(DOCKER_RUN) $(REPOSITORY):dotnet-core-latest

run-dotnet-core-latest-Hello-World: build-dotnet-core-latest
	$(DOCKER_RUN) $(REPOSITORY):dotnet-core-latest --target=Hello-World

push-dotnet-core-latest: run-dotnet-core-latest
	$(DOCKER) push $(REPOSITORY):dotnet-core-latest

build-dotnet-core-2-sdk:
	$(DOCKER) build -t $(REPOSITORY):dotnet-core-2-sdk flavors/dotnet-core/2-sdk

run-dotnet-core-2-sdk: run-dotnet-core-2-sdk-Default run-dotnet-core-2-sdk-Hello-World

run-dotnet-core-2-sdk-Default: build-dotnet-core-2-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-core-2-sdk

run-dotnet-core-2-sdk-Hello-World: build-dotnet-core-2-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-core-2-sdk --target=Hello-World

push-dotnet-core-2-sdk: run-dotnet-core-2-sdk
	$(DOCKER) push $(REPOSITORY):dotnet-core-2-sdk

build-dotnet-framework-sdk:
	$(DOCKER) build -t $(REPOSITORY):dotnet-framework-sdk flavors/dotnet-framework/sdk

run-dotnet-framework-sdk: run-dotnet-framework-sdk-Default run-dotnet-framework-sdk-Hello-World

run-dotnet-framework-sdk-Default: build-dotnet-framework-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-framework-sdk

run-dotnet-framework-sdk-Hello-World: build-dotnet-framework-sdk
	$(DOCKER_RUN) $(REPOSITORY):dotnet-framework-sdk --target=Hello-World

push-dotnet-framework-sdk: run-dotnet-framework-sdk
	$(DOCKER) push $(REPOSITORY):dotnet-framework-sdk
