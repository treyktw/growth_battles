# Use an Ubuntu base image
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    git-lfs \
    wget \
    unzip \
    libssl-dev \
    libx11-dev \
    libxcursor-dev \
    libxinerama-dev \
    libxrandr-dev \
    libasound2-dev \
    libpulse-dev \
    libudev-dev \
    libglu1-mesa-dev \
    xorg-dev

# Install NVIDIA Container Toolkit
RUN apt-get install -y nvidia-container-toolkit

# Set up the workspace
WORKDIR /workspace

# Copy backup script
COPY backup-script.sh /workspace/backup-script.sh
RUN chmod +x /workspace/backup-script.sh

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]