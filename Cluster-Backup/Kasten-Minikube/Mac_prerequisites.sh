#Install docker
echo "--------------------Installing Docker--------------------"
#!/bin/bash
# Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Docker
brew install --cask docker

# Start Docker
open /Applications/Docker.app
#Install Kubectl
echo "----------"----------Installing Kubectl"--------------------"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl
#Install Minikube
echo "--------------------Installing Minikube--------------------"
brew install hyperkit
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
#Install K9s
echo "--------------------Installing K9s--------------------"
brew install k9s
# Install Helm 
echo "--------------------Installing Helm--------------------"
brew install helm
#Add docker to sudo group
echo "--------------------Add Docker to Sudo group--------------------"
sudo dseditgroup -o edit -a $USER -t user docker && sudo chown $USER /var/run/docker.sock
