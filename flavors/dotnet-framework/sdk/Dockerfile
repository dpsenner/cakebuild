FROM microsoft/dotnet-framework:sdk

# Copy bootstrapper script
COPY build.ps1 C:/build.ps1

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["powershell", "C:/build.ps1"]
