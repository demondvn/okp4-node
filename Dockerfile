# Use golang image as the base image
FROM golang:latest

# Install required packages
RUN apt update && apt install -y curl git jq lz4 build-essential unzip tar

# Clone okp4d repository and checkout v3.0.0
RUN git clone https://github.com/okp4/okp4d.git && \
    cd okp4d && \
    git checkout v3.0.0

# Install okp4d
RUN cd okp4d && make install
COPY script.sh script.sh
RUN chmod +x script.sh
# Set the entrypoint
ENTRYPOINT ["./script.sh"]
