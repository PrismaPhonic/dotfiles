# Install Operator sdk 0.7.0 and install as operator2-sdk to not conflict

# create temp dir to be destroyed at end
mkdir operator2-temp
cd operator2-temp

# make paths
mkdir -p $GOPATH/src/github.com/planetscale

# Set the release version variable
RELEASE_VERSION=v0.7.0
curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

# Verify the download release binary
curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu.asc

gpg --verify operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu.asc
gpg --recv-key "0E3182AFC996ABF6"

sudo chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
&& sudo cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator2-sdk

cd ~/code/go/src/github.com/planetscale/
git clone git@github.com:planetscale/planetscale-operator.git

cd planetscale-operator/planetscale-operator2

# Manually install gen-crd-api-reference-docs dependency
mkdir dep-temp
cd dep-temp
wget https://github.com/ahmetb/gen-crd-api-reference-docs/releases/download/v0.1.2/gen-crd-api-reference-docs_linux_amd64.tar.gz
tar xzf gen-crd-api-reference-docs_linux_amd64.tar.gz
sudo chmod a+x gen-crd-api-reference-docs
mv gen-crd-api-reference-docs $GOPATH/bin/gen-crd-api-reference-docs

# Install AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Remove dependency temp folder
cd ../
sudo rm -r dep-temp

# Build operator2
dep ensure -v 
make build 

# This seems required per readme
sudo apt install jq

cd ~/git/dotfiles
sudo rm -r operator2-temp

# Configure docker to use minikube daemon so we can test changes without pushing
# to a registry
eval $(minikube docker-env)
