# Base image with CUDA and cuDNN
FROM nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04

# Install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    vim \
    ca-certificates \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    libhdf5-serial-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh \
    && bash miniconda.sh -b -p /root/miniconda3 \
    && rm miniconda.sh

# Set up Conda environment
COPY environment.yml /root/environment.yml
RUN conda env create -f /root/environment.yml

# Activate Conda environment
SHELL ["conda", "run", "-n", "cobanov", "/bin/bash", "-c"]

# Set up a common volume
VOLUME /workspace