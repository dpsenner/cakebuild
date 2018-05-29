FROM microsoft/dotnet-framework:sdk

# Copy bootstrapper script
COPY build.ps1 /build.ps1

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["/build.ps1"]