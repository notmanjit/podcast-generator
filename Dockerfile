# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.12 \
#     python3-pip \
#     git

# RUN pip3 install --upgrade pip

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]



FROM ubuntu:latest

# Install system dependencies and Python
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    python3.12-venv \
    python3.12-dev \
    build-essential \
    git \
    curl

# Upgrade pip using get-pip.py
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.12 get-pip.py

# Install PyYAML
RUN pip3 install PyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
