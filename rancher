#create log file
echo "create log file"

#get local ip
echo "Fetching IP"
local_ip=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -n 1)
url=$($local_ip).sslip.io

#install dependencies
echo "installing dependencies"
apt install curl -y 

#kubectl server
echo "installing rancher"
curl -sfL https://get.k3s.io | sh -s - server --cluster-init
#helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash 
#cert manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.crds.yaml 
helm repo add jetstack https://charts.jetstack.io 
helm repo update 
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config 
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace 
#deploy rancher
kubectl create namespace cattle-system 
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest 
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=$url 

#fetch and print the password
echo "initial login password: $(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{ .data.bootstrapPassword|base64decode}}{{ "\n" }}')"

echo "if you did not get 'initial login password: <PASSWORD>' at the end of the script, check /var/log/ryzen/rancher for errors"
