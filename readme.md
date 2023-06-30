# Deep Learning Development Environment

This Dockerfile provides a CUDA-enabled deep learning development environment with NVIDIA CUDA 11.8 and PyTorch 2.0. It allows you to easily set up a consistent development environment across different machines and persist the Conda environment to avoid downloading packages repeatedly.

## Build the Docker Image

1. Clone or download this repository to your local machine.
2. Open a terminal and navigate to the directory containing the Dockerfile.
3. Build the Docker image by running the following command:

```bash
docker build -t deep-learning-env .
```

## Run the Docker Container

1. Once the Docker image is built, you can run a container based on that image using the following command:

```bash
docker run --gpus all -p 8888:8888 -v /path/to/shared/directory:/workspace deep-learning-env
```

Replace `/path/to/shared/directory` with the local directory path on your PC that you want to share with the Docker container. This volume mapping allows you to access files and data from both the container and your local PC.

2. Access JupyterLab: Open your web browser and navigate to `http://localhost:8888`. You will be prompted to enter a token, which you can find in the container logs or terminal output.

## Shared Volume

The Docker container is configured with a shared volume that allows you to access files and data from both the container and your local PC. Any changes made within the shared volume will be reflected in both environments. To use the shared volume, make sure to specify the correct local directory path when running the Docker container.
