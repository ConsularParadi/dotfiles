
# Drivers
sudo dnf install xorg-x11-drv-nvidia-cuda
sudo dnf install akmod-nvidia

# Dependencies
curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
sudo dnf install -y nvidia-container-toolkit

sudo systemctl start nvidia-persistenced
sudo systemctl enable nvidia-persistenced

nvidia-smi

# Run GPU Docker Container
sudo docker run --gpus all --privileged -p 8888:8888 -d tensorflow/tensorflow:latest-gpu-jupyter --container-name tensorflow
