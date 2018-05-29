DOCKER=docker
REPOSITORY=dpsenner/cakebuild
DOCKER_RUN_LINUX=$(DOCKER) run --rm -v $(abspath test/workspace):/workspace -w /workspace
DOCKER_RUN_WINDOWS=$(DOCKER) run --rm -v test/workspace:/workspace -w /workspace

build-linux: build-dotnet-core-latest build-dotnet-core-2-sdk
push-linux: push-dotnet-core-latest push-dotnet-core-2-sdk
run-linux: run-dotnet-core-latest run-dotnet-core-2-sdk
build-windows: build-dotnet-framework-sdk
push-windows: push-dotnet-framework-sdk
run-windows: run-dotnet-framework-sdk

build-dotnet-core-latest:
	$(DOCKER) build -t $(REPOSITORY):dotnet-core-latest flavors/dotnet-core/latest

run-dotnet-core-latest: run-dotnet-core-latest-Default run-dotnet-core-latest-Hello-World

run-dotnet-core-latest-Default: build-dotnet-core-latest
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-core-latest

run-dotnet-core-latest-Hello-World: build-dotnet-core-latest
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-core-latest --target=Hello-World

push-dotnet-core-latest: run-dotnet-core-latest
	$(DOCKER) push $(REPOSITORY):dotnet-core-latest

build-dotnet-core-2-sdk:
	$(DOCKER) build -t $(REPOSITORY):dotnet-core-2-sdk flavors/dotnet-core/2-sdk

run-dotnet-core-2-sdk: run-dotnet-core-2-sdk-Default run-dotnet-core-2-sdk-Hello-World

run-dotnet-core-2-sdk-Default: build-dotnet-core-2-sdk
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-core-2-sdk

run-dotnet-core-2-sdk-Hello-World: build-dotnet-core-2-sdk
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-core-2-sdk --target=Hello-World

push-dotnet-core-2-sdk: run-dotnet-core-2-sdk
	$(DOCKER) push $(REPOSITORY):dotnet-core-2-sdk

build-dotnet-framework-sdk:
	$(DOCKER) build -t $(REPOSITORY):dotnet-framework-sdk flavors/dotnet-framework/sdk

run-dotnet-framework-sdk: run-dotnet-framework-sdk-Default run-dotnet-framework-sdk-Hello-World

run-dotnet-framework-sdk-Default: build-dotnet-framework-sdk
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-framework-sdk

run-dotnet-framework-sdk-Hello-World: build-dotnet-framework-sdk
	$(DOCKER_RUN_LINUX) $(REPOSITORY):dotnet-framework-sdk --target=Hello-World

push-dotnet-framework-sdk: run-dotnet-framework-sdk
	$(DOCKER) push $(REPOSITORY):dotnet-framework-sdk
