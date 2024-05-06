IPADDR="192.168.80.211"
NODENAME=$(hostname -s)
POD_CIDR="192.168.0.0/24"

sudo kubeadm init --apiserver-advertise-address=$IPADDR  --apiserver-cert-extra-sans=$IPADDR  --pod-network-cidr=$POD_CIDR --node-name $NODENAME --ignore-preflight-errors Swap

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get po -n kube-system

kubectl get --raw='/readyz?verbose'

kubectl cluster-info 

