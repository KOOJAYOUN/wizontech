exit
sudo -i
vim ~/.vimrc
sudo apt install -y nfs-kernel-server
ssh ubuntu@10.7.11.22
ssh ubuntu@10.7.11.23
ssh ubuntu@10.7.11.24
git clone https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner.git
cd ~/nfs-subdir-external-provisioner/deploy
kubectl create -f rbac.yaml
vim deployment.yaml
sudo -i 
kubectl create -f deployment.yaml
kubectl create -f class.yaml
kubectl get storageclasses.storage.k8s.io
kubectl patch storageclasses.storage.k8s.io nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl describe storageclasses.storage.k8s.io nfs-client
kubectl get storageclasses.storage.k8s.io
kubectl get all -n kube-system
kubectl top nodes
cd ~
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
sudo apt update
sudo apt install openjdk-11-jre
java -version
curl -fsSL <https://pkg.jenkins.io/debian-stable/jenkins.io.key> | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
jenkins --version
sudo systemctl status jenkins.service
kubectl get all
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm ls -n monitoring
helm install prometheus prometheus-community/kube-prometheus-stack
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
kubectl get svc -n monitoring
kubectl patch service -n monitoring prometheus-kube-prometheus-prometheus -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get services -n monitoring prometheus-kube-prometheus-prometheus 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get service -n monitoring prometheus-grafana 
kubectl edit -n monitoring service prometheus-grafana 
kubectl get service -n monitoring prometheus-grafana 
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": "3001"}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": "3001"}}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": ["port": "3001"]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": 3001}}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 3001}]}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": "3001"}]}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{“name”: “http-web”, "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": "3001"}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": "3003"}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3003}]}}'
kubectl edit -n monitoring service prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": "3001"}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"name": "http-web", "port": 3001}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": ({"name": "http-web", "port": 3001})}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"name": "http-web": {"port": "3001"}}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"name": "http-web": {"port": 3001}}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": ["port": 3001]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": ["port": "3001"]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": "3001"}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": ["name": "http-web", "port": 3001]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": http-web, "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3001}]}}'
sudo apt-get update
sudo apt-get install python3 python3-pip -y
git clone -b v2.18.1 https://github.com/kubernetes-sigs/kubespray
cd ~/kubespray/
sudo pip3 install -r requirements.txt
cp -rfp inventory/sample/ inventory/mycluster
vim inventory/mycluster/inventory.ini
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
vim inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
ssh-keygen
ssh-copy-id ubuntu@localhost
ssh-copy-id ubuntu@10.7.11.22
ssh-copy-id ubuntu@10.7.11.23
ssh-copy-id ubuntu@10.7.11.24
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" --become
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
ssh ubuntu@10.7.11.23
ssh ubuntu@10.7.11.24
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
vim ansible.cfg 
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" --become
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
ssh ubuntu@10.7.11.22
ssh ubuntu@localhost
ssh ubuntu@10.7.11.23
ssh ubuntu@10.7.11.24
vim inventory/mycluster/inventory.ini
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
ansible --versio
vim ansible.cfg 
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" --become
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
vim ansible.cfg 
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" --become
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
vim cluster.yml 
vim scale.yml 
ansible-playbook -i inventory/mycluster/inventory.ini -v -b --become-user root -e ansible_ssh_timeout=30 cluster.yml
cd ~
mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown ubuntu:ubuntu ~/.kube/config
kubectl get nodes
sudo apt-get install -y bash-completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
bash
sudo -i
hostnamectl set-hostname k8s-control
bash
vim elasticsearch-persistentvolume.yaml
vim elasticsearch-statefulset.yaml
vim elasticsearch-service.yaml
kubectl create -f ./
cd ~/logging/kibana/
vim kibana-configmap.yaml
vim kibana-deployment.yaml
vim kibana-service.yaml
kubectl create -f ./
vim kibana-deployment.yaml 
cd ~/web/
vim web-deployment.yaml
vim web-service.yaml
vim web-ingress.yaml
ssh ubuntu@10.7.11.22
ssh ubuntu@10.7.11.26
history
cd kubespray/
history
kubectl get services -n monitoring 
kubectl edit -n monitoring prometheus-grafana
kubectl edit services -n monitoring prometheus-grafana
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": "3001"}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}'
kubectl edit services -n monitoring prometheus-grafana
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"prot": 3000}}}'
kubectl edit services -n monitoring prometheus-grafana
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": 3000}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}', '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3001}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 80}]}}'
helm list -n monitoring
helm delete -n monitoring prometheus
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
kubectl patch service -n monitoring prometheus-kube-prometheus-prometheus -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get services -n monitoring prometheus-kube-prometheus-prometheus
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 80}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": ["http-web"], "port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{["name": "http-web"], "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{["name"]: "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{["name"]: "http-web", "port": 3000, "protocol": "TCP", "targetProt": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{["name"]: "http-web", "port": 3000, "protocol": "TCP", "targetPort": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000, "protocol": "TCP", "targetPort": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana 
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 80}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 300}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": http-web, "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 80}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": 80}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {"port": "80"}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": {kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 80}]}}'"port": "80"}}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 80}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 80}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"port": 3000}]}}'
kubectl edit services -n monitoring prometheus-grafana
kubectl create ns logging
git clone https://github.com/fluent/fluent-bit-kubernetes-logging.git
cd fluent-bit-kubernetes-logging/
kubectl create -f fluent-bit-service-account.yaml -f fluent-bit-role-1.22.yaml -f fluent-bit-role-binding-1.22.yaml -f output/elasticsearch/fluent-bit-configmap.yaml -f output/elasticsearch/fluent-bit-ds.yaml 
kubectl get all -n logging -l k8s-app=fluent-bit-logging
mkdir ~/logging/elasticsearch && cd ~/logging/elasticsearch
cd ~
mkdir logging && cd logging
mv ~/kubespray/fluent-bit-kubernetes-logging/ ~/logging/
mkdir ~/logging/elasticsearch && cd ~/logging/elasticsearch
vim elasticsearch-configmap.yaml
kubectl get all -n logging
curl 10.233.8.37:9200
mkdir ~/logging/kibana && cd ~/logging/kibana
kubectl get all -n logging
ls
vim kibana-service.yaml 
kubectl 
kubectl create -f kibana-service.yaml -n logging
vim kibana-service.yaml 
kubectl create -f kibana-service.yaml -n logging
kubectl get all -n logging
curl 10.7.11.21:32610
kubectl get nodes -o wide
kubectl get pods -n logging -o wide
curl 10.233.25.81:33000
curl 10.233.25.81:32601
ls
vim kibana-deployment.yaml 
kubectl delete -f ./
kubectl create -f ./
kubectl get nodes
kubectl label node kube-node1 logging=kibana
kubectl label node k8s-node01 logging=kibana
kubectl delete -f ./
kubectl create -f ./
kubectl delete -f ./
kubectl create -f ./
kubectl delete -f ./
kubectl create -f ./
kubectl get pod -n logging 
kubectl get pod -n logging -o wide
kubectl get services -n logging 
kubectl get nodes -o wide
vim kibana-service.yaml 
kubectl get pods -A | grep nginx-controlle
mkdir ~/web && cd ~/web
vim web-deployment.yaml
kubectl get all
kubectl create ns web
kubectl delete ns web
kubectl create ns webserver
kubectl create -f ./
kubectl get all -n webserver 
kubectl get all
kubectl delete -f ./
kubectl get all -n webserver 
kubectl delete -f ./
kubectl get all -n logging 
kubectl create -f ./
kubectl get all -n webserver 
kubectl delete -f web-ingress.yaml 
kubectl get ingress
kubectl get ingress web-ingress 
kubectl delete ingress web-ingress 
kubectl create -f web-ingress.yaml 
kubectl get all -n webserver 
kubectl get ingress -n webserver 
curl --resolve www.example.com:80:10.7.11.22:8001
curl --resolve www.example.com:80:10.7.11.22:80
curl --resolve myapp.example.com:80:10.7.11.22 <http://www.example.com/\\?detail\\=header>
kubectl edit ingressclasses nginx
kubectl edit ingressclasses nginx -n webserver 
kubectl get ingress
kubectl get ingress -n webserver 
kubectl edit ingressclasses  -n webserver 
kubectl describe ingresses.networking.k8s.io web-ingress -n webserver
curl www.example.com
kubectl get all -n webserver 
kubectl delete -f ,.
kubectl delete -f ./
kubectl create -f ./
kubectl get ingress -n webserver 
kubectl describe ingress web-ingress -n webserver 
curl www.example.com:8001
curl www.example.com:80
kubectl get services -n webserver ingress
kubectl get services -n webserver
kubectl get ingress -n webserver
kubectl get all -n ingress-nginx
kubectl get services ingress-nginx-controller -n A
kubectl get services ingress-nginx-controller
kubectl get services ingress-nginx-controller -n ingress-nginx 
kubectl logs --namespace=ingress-nginx ingress-nginx-controller-452ln 
kubectl edit services ingress-nginx-controller -n ingress-nginx
q
kubectl edit services ingress-nginx-controller -n ingress-nginx
kubectl edit services ingress-nginx-controller -n A
kubectl edit services ingress-nginx-controller -n all
kubectl edit services ingress-nginx-controller 
kubectl get services ingress-nginx-controller 
kubectl get services ingress-nginx-controller -n ingress-nginx 
kubectl get all ingress-nginx-controller -n ingress-nginx 
kubectl get all -n ingress-nginx 
ssh 10.7.11.26
exit
kubectl get service -n monitoring prometheus-grafana
kubectl edit services -n monitoring prometheus-grafana
kubectl get service -n monitoring prometheus-grafana
kubectl edit services -n monitoring prometheus-grafana
kubectl get service -n monitoring prometheus-grafana
kubectl get services
kubectl get services -n all
kubectl get services -A
cd ~/web/
ls
kubectl delete -f ./
kubectl edit services -n monitoring prometheus-grafana
kubectl get services -n monitoring prometheus-grafana
helm delete prometheus -n monitoring
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
kubectl patch service -n monitoring prometheus-kube-prometheus-prometheus -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get services -n monitoring prometheus-kube-prometheus-prometheus
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}' -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}'
kubectl edit services -n monitoring prometheus-grafana
kubectl create -f ./
kubectl get services -n webserver 
kubectl get ingress -n webserver 
cd ..
ls
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
cd web/
ls
kubectl delete -f ./
vim web-ingress.yaml 
vim web-service.yaml 
kubectl create -f ./
kubectl get all -n webserver 
kubectl get ingrees -n webserver 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver 
kubectl get services nginx-ingress-controller -n ingress-nginx 
kubectl get services nginx-ingress-controller -A
kubectl get all -n ingress-nginx
cd ~/kubespray/
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
cd ~/web/
kubectl delete -f ./
kubectl delete ingress -n webserver ingress
kubectl create -f ./
kubectl get ingress -A
kubectl describe ingress web-ingress -A
kubectl describe ingress web-ingress -webserver
kubectl describe ingress web-ingress -n webserver
kubectl delete ingress web-ingress -n webserver
kubectl create -f web-ingress.yaml 
sudo /etc/hosts
sudo vim /etc/hosts
kubectl create -f ./
kubectl get services -n webserver 
kubectl delete -f ./
kubectl create -f ./
kubectl get services -n webserver 
kubectl delete -f ./
kubectl create -f ./
kubectl get services -n webserver 
curl 10.7.11.123:8001
cd ingress/
kubectl create -f test-ingress.yaml 
kubectl get ingess -n webserver
kubectl get ingress -n webserver
kubectl get ingresses -n webserver
kubectl get ingresses -A
kubectl describe ingress example-ingress 
kubectl delete -f test-ingress.yaml 
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress example-ingress -n webserver
curl hell-world.info
curl hello-world.info
sudo vim /etc/hosts
curl hello-world.info
curl 10.7.11.22:8001
kubectl get services -n webserver 
cd ..
kubectl delete -f web-service.yaml 
kubectl create -f web-service.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver 
cd ingress/
kubectl delete -f test-ingress.yaml 
kubectl create -f test-ingress.yaml 
kubectl describe ingress -n webserver 
kubectl get services -n webserver 
curl 10.7.11.22:8001
curl 10.7.11.22:30928
curl hello-world.info
kubectl get pods -o wide -n webserver 
exit
sudo vim /etc/hosts
curl 10.7.11.23
sudo vim /etc/hosts
curl 10.7.11.22
curl hello-world.info
cd web/
ls
vim web-
vim web-service.yaml 
vim ingress/test-ingress.yaml 
vim ingress/web-ingress.yaml 
kubectl get all -n webserver 
sudo vim /etc/hosts
ssh ubuntu@10.7.11.32
vim ~/.vimrc
ls
sudo vim /etc/exports
sudo -i
kubectl get storageclasses.storage.k8s.io
cd ~/nfs-subdir-external-provisioner/deploy
kubectl create -f deployment.yaml
vim deployment.yaml
kubectl create -f rbac.yaml
kubectl create -f class.yaml
kubectl get storageclasses.storage.k8s.io
kubectl patch storageclasses.storage.k8s.io nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl describe storageclasses.storage.k8s.io nfs-client
kubectl get storageclasses.storage.k8s.io
kubectl get all -n kube-system
kubectl top nodes
cd ~
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
sudo apt update
sudo apt install -y openjdk-11-jre
java -version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
jenkins --version
sudo systemctl status jenkins.service
ls
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
kubectl get svc -n monitoring
kubectl patch service -n monitoring prometheus-kube-prometheus-prometheus -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get services -n monitoring prometheus-kube-prometheus-prometheus
kubectl edit services -n monitoring prometheus-grafana
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"type": "LoadBalancer"}}'
kubectl patch service -n monitoring prometheus-grafana -p '{"spec": {"ports": [{"name": "http-web", "port": 3000}]}}'
kubectl get service -n monitoring prometheus-grafana
kubectl create ns logging
cd logging/
cd fluent-bit-kubernetes-logging/
ls
kubectl create -f fluent-bit-service-account.yaml -f fluent-bit-role-1.22.yaml -f fluent-bit-role-binding-1.22.yaml -f output/elasticsearch/fluent-bit-configmap.yaml -f output/elasticsearch/fluent-bit-ds.yaml 
kubectl get all -n logging -l k8s-app=fluent-bit-logging
cd ~/logging/elasticsearch
vim elasticsearch-configmap.yaml
kubectl create -f ./
kubectl get all -n logging
kubectl label node k8s-node01 logging=kibana
cd ~/logging/kibana
kubectl create -f ./
kubectl get all -n logging
kubectl create ns webserver
cd ~
kubectl create -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all -n ingress-nginx
kubectl edit services ingress-nginx-controller -n ingress-nginx
kubectl get services -n ingress-nginx
kubectl edit ingressclasses nginx
kubectl get ingressclasses
cd ~/web
kubectl create -f ./
cd ingress/
kubectl edit services ingress-nginx-controller -n ingress-nginx
kubectl get services ingress-nginx-controller -A
cd web/ingress/
kubectl delete -f ./
cd ~/kubespray/
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
kubectl get ns
kubectl get all -n ingress-nginx 
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
kubectl get all -n ingress-nginx
kubectl describe pods ingress-nginx-controller-ndlrq -n ingress-nginx
kubectl get all -n ingress-nginx 
kubectl delete daemonset -n ingress-nginx ingress-nginx-controller 
kubectl get all -n ingress-nginx 
kubectl delete daemonset -n ingress-nginx ingress-nginx-controller 
kubectl get all -n ingress-nginx 
kubectl delete pods -n ingress-nginx ingress-nginx-controller-ndlrq 
kubectl delete pods -n ingress-nginx ingress-nginx-controller-ndlrq -f
kubectl delete pods -n ingress-nginx ingress-nginx-controller-ndlrq --force
kubectl get all -n ingress-nginx 
cd ..
kubectl create -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml
kubectl get all -n ingress-nginx
ls
kubectl get all -n ingress-nginx
cd kubespray/
ansible-playbook -i inventory/mycluster/inventory.ini reset.yml --become
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" -b
sudo rm -rf /nfsvolume/*
ansible-playbook -i inventory/mycluster/inventory.ini reset.yml --become -e ansible_ssh_timeout=30
sudo rm -rf /nfsvolume/*
vim inventory/mycluster/group_vars/k8s_cluster/addons.yml
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" -b
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" -b -e ansible_ssh_timeout=30 cluster.yml
ansible all -i inventory/mycluster/inventory.ini -m apt -a "update_cache=yes" -b -e ansible_ssh_timeout=30
ansible-playbook -i inventory/mycluster/inventory.ini -b -e ansible_ssh_timeout=30 cluster.yml
mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown ubuntu:ubuntu ~/.kube/config
kubectl top nodes
cd ~
sudo apt-get install -y bash-completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
bash
kubectl get ingress
kubectl get ingress -n webserver 
cd ~/web/ingress/
vim test-ingress.yaml 
kubectl get services -n ingress-nginx
kubectl edit services ingress-nginx-controller -n ingress-ngin
kubectl edit services ingress-nginx-controller -n ingress-nginx
kubectl get services -n ingress-nginx
kubectl describe services -n ingress-nginx ingress-nginx-controller
kubectl get pods -n ingress-nginx
kubectl -n ingress-nginx exec -it nginx-ingress-controller-c6d66b4fb-7bjjp /bin/bash
kubectl -n ingress-nginx exec -it ingress-nginx-controller-5444f8b96b-l2v4q /bin/bash
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver
kubectl get all -n webserver 
kubectl get ingress -n webserver
kubectl describe ingress -n webserver example-ingress 
kubectl get ingress -n webserver 
curl 10.7.11.23
curl hello-world.info
curl 10.7.11.23
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver example-ingress 
kubectl get services -n ingress-nginx
kubectl describe services -n ingress-nginx ingress-nginx-controller
curl 10.7.11.123
kubectl get ingress -n webserver 
sudo vim /etc/hosts
curl hello-world.info
kubectl describe ingress -n webserver 
curl 10.233.123.7
kubectl delete -f test-ingress.yaml 
vim test-ingress.yaml 
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver 
kubectl edit ingressclasses nginx
kubectl get all -n ingress-nginx 
curl 10.7.11.123
curl --resolve myapp.example.com:80:10.7.11.123 <http://hello-world.info/\\?detail\\=header>
curl --resolve hello-world.info:80:10.7.11.123 <http://hello-world.info/\\?detail\\=header>
curl --resolve hello-world.info:80:10.7.11.123 http://hello-world.info/\\?detail\\=header
curl 10.7.11.123
curl http://10.7.11.123
kubectl delete -f test-ingress.yaml 
vim test-ingress.yaml 
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver example-ingress 
curl 10.233.123.7
kubectl get all -n webserver 
kubectl get all -n webserver -o wide
curl 10.233.123.7:8001
curl 10.7.11.22:8001
curl 10.7.11.21:8001
curl 10.7.11.23:8001
curl web-svc:8001
curl 10.233.48.57:8001
kubectl get ingress -n webserver 
curl hello-world.infp
curl hello-world.info
curl 10.7.11.23
kubectl get all -n ingress-nginx 
curl 10.7.11.123
kubectl delete -f test-ingress.yaml 
vim test-ingress.yaml 
kubectl create -f test-ingress.yaml 
curl 10.7.11.123
kubectl describe service -n ingress-nginx ingress-nginx-controller
curl 10.233.123.6:80
vim test-ingress.yaml 
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver example-ingress 
curl 10.233.123.7
curl www.example.com
kubectl delete -f test-ingress.yaml 
vim test-ingress.yaml 
curl www.example.com
curl 8.8.8.8
kubectl get ingress -n webserver 
kubectl create -f test-ingress.yaml 
kubectl get ingress -n webserver 
curl hello.example.com
curl 10.7.11.23
kubectl describe ingress -n webserver example-ingress 
curl 10.7.11.123
LS
ls
kubectl delete -f test-ingress.yaml 
vim web-ingress.yaml 
kubectl get all -n webserver 
kubectl create -f web-ingress.yaml 
vim web-ingress.yaml 
kubectl create -f web-ingress.yaml 
vim web-ingress.yaml 
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver 
kubectl get ingress -n webserver 
curl 10.7.11.23
curl www.example.com
curl 10.7.11.23:8001
kubectl get ingress -n ingress-nginx 
kubectl get all -n ingress-nginx 
curl 10.7.11.123
kubectl get ingress -n webserver 
kubectl describe -n webserver ingresses.networking.k8s.io web-ingress 
curl 10.233.123.7:80
cd ..
vim web-deployment.yaml 
vim web-service.yaml 
ls -al
kubectl get services -A
history
kubectl get ingress -n ingress-nginx 
kubectl get ingress -n webserver
kubectl get ingress -A
kubectl get ingress 
kubectl get ingress -n webserver 
kubectl get ingress -A
kubectl get -A
exit
cd ~/web/ingress/
ls
vim web-ingress
cat test-ingress.yaml 
cat web-ingress
cat web-ingress.yaml 
kubeqwd
ls
k get po -A
k logs -n ingress-nginx ingress-nginx-controller-5444f8b96b-l2v4q
k get endpoints -A
k get svc 0A
k get svc -A
curl 10.7.11.124
ls
k get ingress -A
k describe ingress -n webserver web-ingress 
k get configmaps -n metallb-system 
k describe configmaps -n metallb-system config 
ls
k edit ingress -n  webserver web-ingress 
k get ingress -n webserver 
wk get ingress -n webserver 
watch kubectl get ingress -n webserver 
k get po -n kube-system 
watch kubectl get ingress -n webserver 
ls
cd web/
ls
cd ingress/
ls
vi web-ingress.yaml 
k delete -f web-ingress.yaml 
k apply -f web-ingress.yaml 
k describe ingress -n webserver web-ingress 
k edit ingress -n webserver web-ingress 
vi web-ingress.yaml 
k apply -f web-ingress.yaml 
k edit ingress -n webserver web-ingress 
k apply -f web-ingress.yaml 
vi web-ingress.yaml 
k get no -o wide
k describe configmaps -n metallb-system config 
vi web-ingress.yaml 
k apply -f web-ingress.yaml 
k delete -f web-ingress.yaml 
k apply -f web-ingress.yaml 
k logs -n ingress-nginx ingress-nginx-controller-5444f8b96b-l2v4q -f
k logs -n ingress-nginx ingress-nginx-controller-5444f8b96b-l2v4q --all-containers 
k get po -A
k describe ingress -n webserver web-ingress 
k logs -n metallb-system controller-77c44876d-dpzzf controller 
k rollout restart daemonset -n kube-system kube-proxy 
k delete -f web-ingress.yaml 
k apply -f web-ingress.yaml 
k edit configmaps -n kube-system kube-proxy 
history
k get po -n ingress-nginx 
k describe po -n ingress-nginx ingress-nginx-
k describe po -n ingress-nginx ingress-nginx-controller-5444f8b96b-l2v4q 
k edit svc -n ingress-nginx ingress-nginx-controller
k get svc -n ingress-nginx ingress-nginx-controller
k edit svc -n ingress-nginx ingress-nginx-controller
curl 10.7.11.123
curl 10.7.11.23
k edit svc -n ingress-nginx ingress-nginx-controller
k get configmaps -n ingress-nginx 
k get configmaps -n ingress-nginx ingress-nginx-controller 
k describe configmaps -n ingress-nginx ingress-nginx-controller 
k edit configmaps -n ingress-nginx ingress-nginx-controller 
k edit svc -n ingress-nginx ingress-nginx-controller
vi web-ingress
vi web-ingress.yaml 
k apply -f web-ingress.yaml 
k delete -f web-ingress.yaml 
vi web-ingress.yaml 
k apply -f web-ingress.yaml 
cd ~/web/ingress/
curl 10.7.11.23/
curl http://10.7.11.23/
kubectl get ingress -A
curl 10.7.11.23
kubectl get svc -n ingress-nginx 
kubectl get all -n ingress-nginx 
kubectl edit -n ingress-nginx service ingress-nginx-controller-admission 
kubectl delete -f web-ingress.yaml 
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe -n webserver ingress web-ingress 
kubectl get ingress -n webserver 
curl 10.7.11.23
kubectl edit -n ingress-nginx service ingress-nginx-controller-admission 
kubectl edit -n ingress-nginx service ingress-nginx-controller
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver web-ingress 
curl 10.233.123.7:80
sudo /etc/hosts
sudo vim /etc/hosts
cd ~/web/ingress/
kubectl delete -f ,.
kubectl delete -f ./
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver web-ingress 
kubectl get ingress -n webserver 
kubectl edit ingress -n webserver web-ingress 
curl 10.7.11.23
kubectl get all -n ingress-nginx 
kubectl edit configmap -n kube-system kube-proxy
kubectl edit ingress -n webserver web-ingress 
curl 10.7.11.23:8001
kubectl edit ingress -n webserver web-ingress 
kubectl get service -n webserver 
kubectl get service -n ingress-nginx 
curl 10.7.11.123:31059
kubectl get ingress -n webserver 
curl 10.7.11.23
curl 10.7.11.23:8001
kubectl get ingress -n webserver 
kubectl edit ingress -n webserver web-ingress 
curl 10.7.11.23
kubectl edit ingress -n webserver web-ingress 
curl 10.7.11.23:8001
kubectl delete -f ./
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
curl 10.7.11.23
curl web-svc
kubectl get service -n webserver 
curl 10.233.48.57:8001
cd ..
kubectl delete -f ./
kubectl create -f ./
kubectl create -f ./ingress/web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl get svc -n webserver 
curl 10.233.21.79
curl 10.7.11.23
kubectl get ingress -n webserver 
curl web-svc
curl web-svc:80
curl web-svc.webserver
kubectl describe ingress -n webserver 
kubectl get ingress -n webserver -o wide
kubectl get service -n webserver 
kubectl get all -n ingress-nginx 
kubectl delete -f ./
kubectl delete -f ./ingress/
kubectl create -f ./
kubectl create -f ./ingress/web-ingress.yaml 
kubectl get all -n webserver 
kubectl get ingress -n webserver web-ingress 
kubectl describe ingress -n webserver web-ingress 
kubectl get ingress -n webserver web-ingress 
curl 10.7.11.23
curl 10.7.11.124
sudo vim /etc/hosts
kubectl logs -n ingress-nginx ingress-nginx-controller-5444f8b96b-l2v4q 
kubectl get ingress -n webserver 
curl http://10.7.11.23/
curl http://10.7.11.23:80/
kubectl get svc -n webserver 
kubectl describe ingress -n webserver 
kubectl edit ingress -n webserver web-ingress 
kubectl get ingress -n webserver 
kubectl edit ingress -n webserver web-ingress 
kubectl edit services ingress-nginx-controller -n ingress-nginx
curl 10.7.11.123
kubectl get svc -n ingress-nginx 
kubectl get ingress -n webserver 
curl 10.7.11.125
curl 10.7.11.23
kubectl delete -f ./ingress/web-ingress.yaml 
kubectl create -f ./ingress/web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl describe -n webserver ingress web-ingress 
kubectl get ingress -n webserver 
kubectl edit ingress -n webserver web-ingress 
curl 10.7.11.23
kubectl delete -f ingress/web-ingress.yaml 
kubectl create -f ingress/web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl get ingress -n webserver
kubectl edit ingress -n webserver web-ingress 
kubectl get ingress -n webserver
kubectl edit ingress -n webserver web-ingress 
kubectl edit svc -n ingress-nginx ingress-nginx-controller
kubectl delete -f ingress/web-ingress.yaml 
kubectl create -f ingress/web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl create -f ingress/test-ingress.yaml 
kubectl get ingress -n webserver 
curl 10.7.11.23
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver example-ingress 
kubectl get ingress -n webserver 
curl 10.7.11.23ku
kubectl delete -f ingress/.
kubectl create -f ingress/web-ingress.yaml 
kubectl get ingress -n webserver 
kubectl get all -n ingress-nginx 
curl 10.7.11.123
kubectl describe ingress -n webserver web-ingress 
kubectl get all -n webserver 
curl 10.233.123.9:80
kubectl delete -f ./
kubectl delete -f ../
kubectl create -f ../
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
curl 10.7.11.23
kubectl get all -n ingress-nginx 
curl 10.7.11.123
kubectl delete -f ./
kubectl delete -f ../
kubectl create -f ../
kubectl get all -n webserver 
kubectl create -f ./
kubectl delete -f ./
kubectl create -f web-ingress
kubectl create -f web-ingress.yaml 
kubectl get ingress -n webserver 
curl 10.7.11.123
kubectl get ingress -n webserver 
kubectl describe ingress -n webserver  web-ingress 
kubectl get ingress -n webserver 
kubectl delete -f web-ingress.yaml 
curl 10.7.11.123
kubectl create -f web-ingress-copy.yaml 
kubectl get ingress -n webserver 
curl 10.7.11.123
kubectl get all -n logging
kubectl describe service -n logging elasticsearch-nodeport 
curl 10.233.123.5:9200
curl 10.233.20.64:9200
curl 10.7.11.22:30920
curl 10.233.20.64:9200
curl 10.233.123.5:9200
curl 10.7.11.22:30920
kubectl describe service -n logging elasticsearch
curl 10.233.123.5:9300
kubectl get all -n logging 
kubectl get pods -o wide -n logging 
curl 10.7.11.22:30920
curl 10.7.11.23:30920
curl 10.7.11.24:30920
curl 10.7.11.24:326201
curl 10.7.11.24:32601
curl 10.7.11.23:32601
curl 10.7.11.22:32601
curl 10.7.11.22:32601 -d
curl 10.7.11.22:32601 -v
curl 10.7.11.21:30920
kubectl describe services -n logging kibana 
curl 10.233.67.5:5601
curl 10.7.11.24:32601
mkdir dockerfile
cd dockerfile/
vim Dockerfile
vim index.html
docker build -t login:centos1 .
sudo apt  install docker.io
docker build -t login:centos1 .
docker login
sudo docker login
docker build -t login:centos1 .
sudo docker build -t login:centos1 .
sudo docker tag login:centos1 kiwini99/login:centos1
sudo docker push kiwini99/login:centos1
cd ~/web/
kubectl delete -f ./
kubectl create -f ./
kubectl get all -n webserver 
kubectl get all -n webserver --w
kubectl get all -n webserver -w
kubectl get all -n webserver -watch
kubectl get all -n webserver --watch
kubectl get all -n webserver -W
kubectl get --help
kubectl get all -n webserver -w
kubectl get pods -n webserver -w
kubectl edit -n webserver pods web-deployment-75f88d9d57-wl9xf 
cd ~/dockerfile/
cat index.html 
cd ~/web/
kubectl delete -f ./
cd ~/dockerfile/
ls
sudo docker build -t login:centos2 .
sudo docker tag login:centos2 kiwini99/login:centos2
sudo docker push kiwini99/login:centos2
cd ~/web/
kubectl create -f ./
kubectl get pods -n webserver -w
kubectl get all -n ingress-nginx 
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl get all -n ingress-nginx 
kubectl edit services -n ingress-nginx ingress-nginx-controller
kubectl patch service -n ingress-nginx ingress-nginx-controller -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get services -n ingress-nginx ingress-nginx-controller
cd ~www-data
cd ~/web/
ls
kubectl delete -f ./
kubectl create -f ./
kubectl get ingress -n webserver 
curl 10.7.11.123
kubectl describe ingress -n webserver web-ingress 
kubectl get all -n monitoring 
sudo systemctl status jenkins.service
lsb_release -a
free -h
ssh 10.7.11.22
cd dockerfile/
sudo docker build -t login:centos3 .
sudo docker tag login:centos3 kiwini99/login:centos3
sudo docker push kiwini99/login:centos3
cd ~/web/
kubectl delete -f ./
kubectl create -f ./
kubectl get all -n webserver 
kubectl get all -n monitoring 
kubectl get services -n monitoring 
kubectl describe services -n monitoring prometheus-kube-prometheus-prometheus 
kubectl get pods -n monitoring 
kubectl describe pods -n monitoring prometheus-prometheus-kube-prometheus-prometheus-0
kubectl edit services -n monitoring prometheus-kube-prometheus-prometheus 
cd dockerfile/
sudo docker images
sudo docker rmi kiwini99/login:centos1
sudo docker tage login:centos3 kiwini99/login:centos1
sudo docker tag login:centos3 kiwini99/login:centos1
sudo docker push kiwini99/login:centos1
sudo usermod -aG docker ubuntu
grep docker /etc/group
docker ps
exit
docker ps
docker images 
cd web/
kubectl delete -f ./
vim web-deployment.yaml 
docker ps
docker images
exit
cd web/
vim web-deployment.yaml 
kubectl create -f ./
kubectl get pods -n webserver -o wide
kubectl get all -n webserver 
docker ps
docker images
docker rmi login:centos1
docker rmi login:centos2
docker images
docker rmi login:centos3
docker images
docker rmi kiwini99/login:centos1
docker rmi kiwini99/login:centos2
docker rmi kiwini99/login:centos3
cd ~/dockerfile/
docker build -t login:centos1 .
docker tag login:centos1 kiwini99/login:centos1
docker push kiwini99/login:centos1
grep docker /etc/group
exit
sudo systemctl status jenkins
sudo systemctl enable jenkins && restart jenkins
sudo systemctl enable jenkins && systemctl restart jenkins
sudo systemctl status jenkins
sudo usermod -aG docker jenkins
sudo systemctl enable jenkins && systemctl restart jenkins
docker login
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git branch -M main
echo "# wizontech" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git innit
git init
git add README.md 
git commit -m "first commit"
ls
ls -al
sudo rm -rf ~/.git/
mkdir github
cd github/
ls
echo "# wizontech" >> README.md
git init
git add README.md 
git commit -m "first commit"
git congit --global --edit
git config --global --edit
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git branch -M main
LS
ls
git push -u origin mani
git push -u origin main
git clone https://github.com/KOOJAYOUN/wizontech.git
git add .
ls
cd wizontech/
ls
echo "# wizontech" >> README.md
git add .
git commit -m "first commit"
git config --global user.name "KOOJAYOUN"
git config --global user.email "kiwini99@naver.com"
git commit -m "first commit"
git branch -M main
git commit -m "first commit"
ls -al
git remote add origin https://github.com/KOOJAYOUN/wizontech.git]
git push -u origin main
ls -al ./.git/
ls -al ./.git/config 
ls -al ./.git/config/
cat ./.git/config
git add .
git commit -m "2"
git branch --unset-upstream
git commit -m "2"
git add .
git status
ls
vim README.md 
git add .
git commit -m "1"
git push -u origin main
git pull
git push -u origin main
git remote set-url origin https://github.com/KOOJAYOUN/wizontech.git
git add .
git commit -m "1"
git push
git push origin main
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git branch -M main
git push -u origin main
git remote set-url origin "https://github.com/KOOJAYOUN/wizontech.git"
git remote set-url origin https://github.com/KOOJAYOUN/wizontech.git
git push -u origin main
git login
git push -u origin main
git status 
ls
git add .
git commit -m "test"
touch 111
git status 
git add .
git commit -m "test"
git push
git push -u origin  main 
la -al
cat ./.git/config 
git push -u origin  main 
git init
git add README.md
git commit -m "first commit

git commit -m "first commit
"
git password
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git push -u origin main
cd ..
rm -rf github/
mkdir github
cd github/
echo "# wizont" >> README.md
git init
ls -al
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/KOOJAYOUN/wizont.git
git push -u origin main
git remote add origin git@github.com:KOOJAYOUN/wizont.git
ls
rm README.md 
git status
git add .
git commit -m "1"
git push -u orgin main
git push -u origin main
cd ..
rm -rf
rm -rf github/
mkdir github
cd github/
git init
echo 123
touch 123
git add .
git status
git commit -m "1"
git push
git remot add origin git@github.com:KOOJAYOUN/wizont.git
git remote add origin git@github.com:KOOJAYOUN/wizont.git
git push
git push -u origin master
git push -u origin main
cd ~
git clone https://github.com/KOOJAYOUN/230208.git
ls
cd 230208/
git init .
git config user.name "kiwini99"
git config user.email "kiwini99@naver.com"
cat .git/config 
touch 1234
ls
git add .
git commit -m "1"
git remote add qqq https://github.com/KOOJAYOUN/230208.git
git push -u qqq master 
git remote add origin https://github.com/KOOJAYOUN/230208.git
git push -u origin master 
sudo cat ~/.ssh/id_rsa.pub
git push -u origin master 
git push -u qqq master 
git remote add qqq https://github.com/KOOJAYOUN/230208.git
git remote add 1234 https://github.com/KOOJAYOUN/230208.git
git push -u 1234 master 
git remote remove qqq
git remote add qqq git@github.com:KOOJAYOUN/230208.git
git push -u qqq master
git remote add aaa https://github.com/KOOJAYOUN/230208.git
touch 1111
git add .
git status
git push -u aaa master
git pull origin main
git pull origin master
git commit -m "2
"
git push origin main
git push origin master
cd /var/www/htdocs/
git version
git push -u aaa master
ls
cd 230208/
ls
git push -u aaa master
git remote -v
cd ..
ls
rm -rf 230208/
rm -rf github/
rm README.md 
LS
ls
mkdir github
cd github/
git pull https://github.com/KOOJAYOUN/wizontech.git
echo "# wizontech" >> README.md
git init
git add README.md 
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git push -u origin master
git push -u origin main
touch 123
git add .
git commit -m "2"
git push
cat ~/.ssh/id_rsa,pub
cat ~/.ssh/id_rsa.pub 
ls
cd github/
ls
cd ..
git pull git@github.com:KOOJAYOUN/wizton.git
rm -rf github/
mkdir github
cd github/
git pull git@github.com:KOOJAYOUN/wizton.git
git clone git@github.com:KOOJAYOUN/wizton.git
ls
cd zi
wizton/
ls
cd wizton/
ls
touch 123
git add .
git commit -m "1"
git push
ls
pwd
exit
ssh ubuntu@10.11.7.31
ssh ubuntu@10.7.11.31
exit
