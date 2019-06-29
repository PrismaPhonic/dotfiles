# download and install godoc server
go get golang.org/x/tools/cmd/godoc

# Install gen-crd-api-reference-docs dependency
cd /tmp
GO111MODULE=on go get github.com/ahmetb/gen-crd-api-reference-docs
