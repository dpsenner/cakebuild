DOCKER=docker
REPOSITORY=dpsenner/cakebuild
DOCKER_RUN=$(DOCKER) run --rm -v $(shell pwd)/test/workspace:/workspace -w /workspace

default: run-all

build-all: build-debian-stretch build-dotnet-sdk-2.1.4

push-all: push-debian-stretch push-dotnet-sdk-2.1.4

run-all: run-debian-stretch run-dotnet-sdk-2.1.4

build-debian-stretch:
	$(DOCKER) build -t $(REPOSITORY):debian-stretch flavors/debian/stretch

run-debian-stretch: run-debian-stretch-Default run-debian-stretch-Hello-World

run-debian-stretch-Default: build-debian-stretch
	$(DOCKER_RUN) $(REPOSITORY):debian-stretch

run-debian-stretch-Hello-World: build-debian-stretch
	$(DOCKER_RUN) $(REPOSITORY):debian-stretch --target=Hello-World

push-debian-stretch: run-debian-stretch
	$(DOCKER) push $(REPOSITORY):debian-stretch

build-dotnet-sdk-2.1.4: build-debian-stretch
	$(DOCKER) build -t $(REPOSITORY):dotnet-sdk-2.1.4 flavors/dotnet-sdk/2.1.4

run-dotnet-sdk-2.1.4: run-dotnet-sdk-2.1.4-Default run-dotnet-sdk-2.1.4-Hello-World

run-dotnet-sdk-2.1.4-Default: build-dotnet-sdk-2.1.4
	$(DOCKER_RUN) $(REPOSITORY):dotnet-sdk-2.1.4

run-dotnet-sdk-2.1.4-Hello-World: build-dotnet-sdk-2.1.4
	$(DOCKER_RUN) $(REPOSITORY):dotnet-sdk-2.1.4 --target=Hello-World

push-dotnet-sdk-2.1.4: run-dotnet-sdk-2.1.4
	$(DOCKER) push $(REPOSITORY):dotnet-sdk-2.1.4
