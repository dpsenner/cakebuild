FROM microsoft/dotnet:latest

# Install requirements
RUN apt-get update && apt-get install unzip && apt-get clean

# Copy bootstrapper script
COPY build.sh /usr/local/bin/build.sh

# Make bootstrapper script executable
RUN chmod +x /usr/local/bin/build.sh

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["/usr/local/bin/build.sh"]
