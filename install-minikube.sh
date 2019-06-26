# Install packages for KVM
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager

# Install docker machine kvm driver
mkdir docker-deps-temp
cd docker-deps-temp
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
sudo chmod +x docker-machine-driver-kvm2
sudo mv docker-machine-driver-kvm2 /usr/local/bin
cd ../
sudo rm -r docker-deps-temp

# Add user to necessary groups
sudo adduser pmfarr libvirt

# Some module stuff
sudo modprobe vhost_net
sudo lsmod | grep vhost
echo "vhost_net" | sudo tee -a /etc/modules

# Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.1.1/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
