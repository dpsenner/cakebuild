FROM microsoft/dotnet-framework:sdk

# Copy bootstrapper script
COPY build.sh /build.ps1

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["/build.ps1"]