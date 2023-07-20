# Hashcat Kasm Workspace

This project aims to create a [Kasm Workspaces](https://kasmweb.com/) docker container that is capable of running [Hashcat](https://hashcat.net/hashcat/) with support for GPU-accelerated computation. The container is built on an Ubuntu (Jammy) base image with Hashcat and the NVIDIA CUDA toolkit installed.

## Prerequisites

1. Docker installed on your machine.
2. An NVIDIA GPU with the appropriate drivers installed.

## Building the Image

To build the Docker image, follow these steps:

1. Clone this repository to your machine.
2. Navigate to the directory containing the Dockerfile.
3. Run the following command:

```bash
docker build -t hashcat-kasm-workspace .
```

This command builds the Docker image and tags it as `hashcat-kasm-workspace`.

## Running the Container

To run the Docker container, use the following command:

```bash
docker run -it --rm \
--gpus all \
-e NVIDIA_DRIVER_CAPABILITIES=compute,utility,display \
hashcat-kasm-workspace
```

This command runs the Docker container with access to all GPUs and sets the appropriate NVIDIA driver capabilities.

## Notes

- This container operates under the assumption that the host's GPU drivers and CUDA toolkit are properly installed and configured. 
- The Dockerfile updates the system, installs Hashcat and the NVIDIA CUDA toolkit, and configures OpenCL to use the NVIDIA driver.
- A custom background is added to the workspace. You can replace the URL with the path of your desired background image.

## Limitations

This project is intended for personal, educational, or research purposes only. Use of hashcat and similar tools should be limited to environments and scenarios where you have obtained the necessary permissions and approvals. Misuse can be in violation of laws and regulations.

Always ensure to follow ethical guidelines when using such tools, and do not use them for unauthorized access, data theft, or similar unethical activities.