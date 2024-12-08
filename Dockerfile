FROM ubuntu:18.04

# Update and install necessary packages
RUN apt update && apt-get install -y wget curl python3 git sudo libuv1-dev libmicrohttpd-dev libssl-dev

# Install Node.js and npm using the official NodeSource distribution
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - && apt-get install -y nodejs

# Remove unnecessary packages and clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose necessary ports
EXPOSE 80 3333

# Add and set permissions for the script
ADD winter.sh /root/
RUN chmod +x /root/winter.sh

# Set the working directory
WORKDIR /root

# Set the entry point
ENTRYPOINT ["./winter.sh"]
