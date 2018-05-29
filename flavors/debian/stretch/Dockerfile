FROM debian:9

# apt update and upgrade
RUN apt-get update && apt-get upgrade -y

# install cake requirements
RUN apt-get install -y curl mono-complete

# clean up package lists
RUN apt-get clean

# Copy bootstrapper script
COPY build.sh /usr/local/bin/build.sh

# Make bootstrapper script executable
RUN chmod +x /usr/local/bin/build.sh

# Make the bootstrapper script the docker entrypoint
ENTRYPOINT ["/usr/local/bin/build.sh"]
