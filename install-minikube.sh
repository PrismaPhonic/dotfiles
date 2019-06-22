# Install packages for KVM
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager

# Add user to necessary groups
sudo adduser pmfarr libvirt

# Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.1.1/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
