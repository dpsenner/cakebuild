FROM debian:8

# apt update and upgrade
RUN apt-get update && apt-get upgrade -y

# install generic requirements
RUN apt-get install -y apt-transport-https curl

# install cake requirements
RUN apt-get install -y mono-complete

# add microsoft key
RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl -s https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/microsoft-prod.list

# install dotnet-sdk
RUN apt-get update && apt-get install -y dotnet-sdk-2.1.4

# clean up package lists
RUN apt-get clean

# Set a few properties as outlined in official dotnet docker containers
ENV DOTNET_SDK_VERSION 2.1.4

# Enable detection of running in a container
ENV DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps perfomance
    NUGET_XMLDOC_MODE=skip

# Opt-out from telemetry feature
ENV DOTNET_CLI_TELEMETRY_OPTOUT true

# Trigger the population of the local package cache
RUN mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch

# Workaround for https://github.com/Microsoft/DockerTools/issues/87. This instructs NuGet to use 4.5 behavior in which
# all errors when attempting to restore a project are ignored and treated as warnings instead. This allows the VS
# tooling to use -nowarn:MSB3202 to ignore issues with the .dcproj project
ENV RestoreUseSkipNonexistentTargets false

# Copy bootstrapper script
COPY build.sh /usr/local/bin/build.sh

# Make bootstrapper script executable
RUN chmod +x /usr/local/bin/build.sh

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["/usr/local/bin/build.sh"]
