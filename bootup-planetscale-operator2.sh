# Stop and delete existing minikube
minikube stop && minikube delete

# Start minikube with correct settings
minikube start --vm-driver kvm2 --cpus 6 --memory 8192 --disk-size 50g --nfs-share $PWD

# Point local docker client to the minikube docker daemon
eval $(minikube docker-env)

# Build docker image for operator 2
cd $GOPATH/src/github.com/planetscale/planetscale-operator/planetscale-operator2
dep ensure
make build

# Deploy dependencies and then deploy operator2
cd $GOPATH/src/github.com/planetscale/planetscale-operator/deploy/cloud-database/local
kustomize build . | kubectl apply -f -
docker pull registry.planetscale.com/cluster/ps-cluster-manager:latest
cd ~/Documents/example-operator2-deploy
kustomize build . | kubectl apply -f -
kubectl create -f example.yaml
