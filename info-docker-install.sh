
echo "=================="
echo "Install DOCKER"
echo "=================="

# swap off
sudo swapoff -a

# Modules
lsmod | grep -i br_netfilter
modprobe br-netfilter
lsmod | grep -i br_netfilter
apt install bridge-utils
lsmod | grep -i bridge
# systed options
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

# review options
vim /etc/sysctl.d/k8s.conf
sysctl --system

# install dockes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get install moby-engine  moby-cli  moby-container
sudo docker run hello-world
apt-get update && apt-get install  -y
