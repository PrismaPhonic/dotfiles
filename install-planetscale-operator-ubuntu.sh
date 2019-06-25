# Grab current dir
export CURRENT_DIR=`pwd`

# Install Go Dep tool
go get -u github.com/golang/dep/cmd/dep
go install github.com/golang/dep/cmd/dep

# Install operator sdk
cd $GOPATH/src/github.com
mkdir operator-framework
cd $GOPATH/src/github.com/operator-framework
git clone git@github.com:operator-framework/operator-sdk.git
cd $GOPATH/src/github.com/operator-framework/operator-sdk
git checkout v0.0.5 # Should be updated after the above issue is fixed
# See `make dep` on operator-sdk master
dep ensure -v
# See `make install` on operator-sdk master
go install github.com/operator-framework/operator-sdk/commands/operator-sdk

# go back to where we were
cd $CURRENT_DIR

# Install operator2
./operator2-install.sh
