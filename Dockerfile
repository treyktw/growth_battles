FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

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
    xorg-dev \
    nvidia-container-toolkit

# Install UE5 dependencies (you may need to adjust this based on your specific UE5 version)
RUN apt-get install -y \
    libopengl0 \
    libvulkan1

WORKDIR /ue5project

# Copy the UE5 project files
COPY . .

# Set up any additional configuration needed for your UE5 server

CMD ["/bin/bash", "-c", "while true; do sleep 1000; done"]