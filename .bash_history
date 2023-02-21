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
ls
cd github/
ls
cd ..
rm -rf github/
echo "# wizontech" >> README.md
git init
git add .
git merge main
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/KOOJAYOUN/wizontech.git
git push -u origin main
cat ~/.ssh/id_rsa.pub 
git remote add origin https://github.com/KOOJAYOUN/wizontech.gitgit remote add origin git@github.com:KOOJAYOUN/wizontech.git
git remote add origin git@github.com:KOOJAYOUN/wizontech.git
git remote set-url origingit@ github.com:KOOJAYOUN/wizontech.git
git remote set-url origin git@github.com:KOOJAYOUN/wizontech.git
git push -u origin main
history
cat ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -m PEM
cat ~/.ssh/authorized_keys 
cat ~/.ssh/id_rsa_jenkins.pub >> ~/.ssh/authorized_keys 
cat ~/.ssh/authorized_keys 
cat ~/.ssh/id_rsa_jenkins
ls
vim ~/dockerfile/index.html 
git add .
git commit -m "0209"
git push
docker login
vim ~/dockerfile/index.html 
git add .
git commit -m "0209-1"
git push
docker ps
docker login
vim ~/dockerfile/index.html 
git add .
git commit -m "0209"
git push
docker push kiwini99/login:4
vim ~/dockerfile/index.html 
git add .
git commit -m "0209-3"
git push
vim ~/dockerfile/index.html 
chmod 700 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa_jenkins.pub 
cd ls
ls
git pull
vim Jenkinsfile
docker login
cd ~/.ssh/
ls
rm id_rsa
rm id_rsa.pub
mv id_rsa
mv id_rsa_jenkins id_rsa
mv id_rsa_jenkins.pub id_rsa.pub
vim authorized_keys 
sudo systemctl restart ssh
sudo systemctl status ssh
ssh-copy-id ubuntu@localhost
ssh-copy-id ubuntu@10.7.11.22
ssh-copy-id ubuntu@10.7.11.23
ssh-copy-id ubuntu@10.7.11.24
cd ~
git add .
git commit -m "2"
git push
cat ~/.ssh/id_rsa.pub 
git push
sudo vim /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo systemctl status sshd
sudo vim /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo systemctl status sshd
ls ~/.ssh/
ls
cd ~/.ssh/
ls
cat authorized_keys 
cat id_rsa.pub 
cat id_rsa
sudo vim /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo systemctl status sshd
cd ~/dockerfile/
pwd
cd ~
ssh-keygen -t rsa -b 4096 -m PEM
cat ~/.ssh/id_rsa_jenkins.pub >> ~/.ssh/authorized_keys
cd ~/.ssh/
ls
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat id_rsa
ssh-copy-id ubuntu@localhost
ssh-copy-id ubuntu@10.7.11.22
ssh-copy-id ubuntu@10.7.11.23
ssh-copy-id ubuntu@10.7.11.24
sudo -i
cat id_rsa.pub
cd ~
cat /etc/hosts
cat id_rsa
cat ~/.ssh/id_rsa
ls
useradd -aG docker jenkins
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins.service 
sudo systemctl status jenkins.service 
grep docker /etc/group
ls
ls -al .ssh/
vim .ssh/id_rsa
java --version
docker ps
docker images
docker image prune
docker images
docker image prune -a
docker images
docker image prune -a
sudo apt-get remove jenkins
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl restart jenkins
sudo systemctl status jenkins
sudo yum remove jenkins
sudo apt-get remove jenkins
rm /etc/sysconfig/jenkins.rpmsave
ls -al /etc/sysconfig/
ls -al /var/lib/jenkins
rm -rf /var/lib/jenkins
sudo systemctl status jenkins
hepl apt-get 
help apt-get 
man -k apt-get
info apt-get
sudo apt-get clean jenkins
sudo systemctl status jenkins
sudo apt-get remove --purge jenkins
sudo systemctl status jenkins
ls -al /etc/apt/sources.list.d/
sudo rm /etc/apt/sources.list.d/jenkins.list 
sudo rm /etc/apt/sources.list.d/jenkins.list.save
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo find / -name 'jenkins*'
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
jenkins --version
sudo systemctl status jenkins.service
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo usermod -aG docker jenkins
sudo systemctl enable jenkins && systemctl restart jenkins
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa
ls
ls -al
cd dockerfile/
pwd
kubectl get -n webserver deployments.apps web-deployment 
ls -al
cd ..
ls
cd dockerfile/
cd ..
ls -al
cat /etc/group
ls -al /etc/sudoers.d
cat /etc/sudoers.d/ubuntu 
sudo vim /etc/sudoers.d/ubuntu 
docker login
docker info | grep Username
su - jenkins
sudo -i jenkins
grep docker /etc/group\
grep docker /etc/group
grep jenkins /etc/group
exit
docker login -u kiwini99
winpty docker login
docker login -u kiwini99 -p
docker logout
docker login -u kiwini99
docker images
docker image prune -a
winpty docker ps
docker images
kubectl get deployments.apps -n webserver web-deployment
kubectl ediv deployments.apps -n webserver web-deployment
kubectl edit deployments.apps -n webserver web-deployment
grep ubunt /etc/group
sudo usermod -aG docker wizontech
docker login -u kiwini99 --password-stdin
docker login
sudo systemctl restart docker.s
sudo systemctl restart docker
sudo systemctl status docker
docker login
docker image prune -a
sudo vi sudo
sudo visudo
docker images
vim ~/dockerfile/index.html 
git add .
git commit -m "0214"
git push
git push origin main
cat ~/.ssh/id_rsa.pub 
git push origin main
vim ~/dockerfile/index.html 
git add .
git commit -m "0214-1"
git push origin main
git push
git remote -v
cat ~/.ssh/id_rsa.pub 
git push origin main
kubectl edit -n webserver deployments.apps web-deployment 
kubectl get ingress -n ingress-nginx 
kubectl get all -n ingress-nginx 
kubectl get all -n webserver 
kubectl describe -n webserver pods web-deployment-7989799cbb-dtzvd 
kubectl get all -n webserver 
kubectl delete pods all -n webserver 
kubectl delete pods --all -n webserver 
kubectl get all -n webserver 
kubectl get all -n webserver --watch
kubectl get all -n webserver -w
kubectl get all -n webserver
kubectl describe pods -n webserver web-deployment-7989799cbb-p7k2h 
docker images
cd web/
ls
kubectl delete -f web-deployment.yaml 
kubectl get all -n webserver
kubectl create -f web-deployment.yaml 
kubectl get all -n webserver
ls
cd ..
cd ~/dockerfile/
ls
vim index.html 
cd ..
git add .
git commit -m "0215"
git push
kubectl get all -n webserver 
kubectl get all -n webserver -watch
kubectl get --help
kubectl get pods --help
kubectl get pods -w
kubectl get pods -w -n webse
kubectl get all -n webserver
kubectl describe -n webserver replicasets.apps web-deployment-6d5c75d9dc 
kubectl get all -n webserver
kubectl patch -n webserver deployments.apps web-deployment -p '{"spec": {"template": {"spec": {"containers": [{"name": "web", "image": "kiwini99/login0209:45}]}}}}'
kubectl patch -n webserver deployments.apps web-deployment -p '{"spec": {"template": {"spec": {"containers": [{"name": "web", "image": "kiwini99/login0209:45"}]}}}}'
kubectl patch -n webserver deployments.apps web-deployment -p '{"spec": {"template": {"spec": {"containers": [{"name": "web", "image": "kiwini99/login0209:44"}]}}}}'
kubectl get all -n webserver
docker images
kubectl get all -n webserver
kubectl describe -n webserver replicasets.apps web-deployment-65cd64fd96 
kubectl describe pods -n webserver pod/web-deployment-65cd64fd96-hldr7
kubectl describe pods -n webserver web-deployment-65cd64fd96-hldr7
kubectl edit -n webserver deployments.apps web-deployment
kubectl delete -f ~/web/web-deployment.yaml 
kubectl create -f ~/web/web-deployment.yaml 
vim ~/dockerfile/index.html 
git add .
git commit -n "0215-2
"
git commit -n "0215-2"
git commit -m "0215-2"
git push
kubectl get all -n webserver 
kubectl get pods -n webserver -w
kubectl get all -n webserver 
mkidr db
mkdir db
ls
cd ~/db/
kubectl create -f mydb-cm-mysql.yaml 
kubectl describe configmaps mydb-config 
kubectl create -f mydb-svc-read.yaml -f mydb-svc-write.yaml 
kubectl get service -l app=mydb
kubectl create -f mydb-sts-mysql.yaml 
kubectl get statefulsets.apps 
kubectl get statefulsets.apps,pods
kubectl run mysql-client -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
mysql -u root -p
sudo apt-get install mysql-client
mysql -u root -p
mysql -u root -h mydb
kubectl delete -f ./
ls
kubectl get all
kubectl delete -f .
kubectl create -f ./
kubectl create ns databese
kubectl create -f ./
kubectl create ns database
kubectl delete ns databese
kubectl create -f ./
kubectl get all -n database 
kubectl get pv,pvc -n database 
cd ..
git add .
git commit -m "0215-2"
git push
kubectl run mysql-client -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash
kubectl run mysql-client -it --image=ghcr.io/c1t1d0s7/network-multitool --rm bash -n database 
mysql -u root -h mydb
mysql -u root -h mydb -n database
mysql -u root -h mydb-0.mydb
mysql -u root -h mydb-0.mydb.database
mysql -u root -h mydb.database
kubectl get all
ls
exit
vim ~/dockerfile/index.html 
git add .
git commit -m "0217"
git push
mkdir wordpress
cd wordpress/
ls
cd db/
kubectl delete -f .
cd db/
kubectl create -f .
kubectl create ns wordpress
kubectl create -f .
kubectl delete -f .
kubectl create -f .
kubectl delete -f .
kubectl create -f .
kubectl delete -f .
kubectl create -f mydb-cm-mysql.yaml 
kubectl create -f mydb-svc-read.yaml -f mydb-svc-write.yaml 
kubectl create -f mydb-sts-mysql.yaml 
kubectl delete -f .
kubectl delete -f ,.
kubectl delete -f .
kubectl get all -n database 
kubectl create -f mydb-cm-mysql.yaml 
kubectl create -f mydb-svc-read.yaml -f mydb-svc-write.yaml 
kubectl create -f mydb-sts-mysql.yaml 
kubectl get all -n database 
kubectl delete -f mydb-sts-mysql.yaml 
kubectl create -f mydb-sts-mysql.yaml 
kubectl get all -n database 
kubectl delete -f .
kubectl create -f wordpress-mydb-cm-mysql.yaml 
kubectl create -f wordpress-mydb-svc-read.yaml -f wordpress-mydb-svc-write.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl describe pods -n wordpress wordpress-mydb-1 
kubectl get all -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl get pods -w -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl get pods -w -n wordpress 
kubectl get all -n wordpress 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get pods -w -n wordpress 
kubectl logs -n wordpress wordpress-mydb-1
kubectl describe pods -n wordpress wordpress-mydb-1
kubectl get pods -n w
kubectl get pods -n wordpress 
kubectl describe pods -n wordpress wordpress-mydb-1
kubectl get pods -n wordpress 
kubectl describe pods -n wordpress wordpress-mydb-1
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n database 
kubectl get pv,pvc
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl get pods -n wordpress -w
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 

kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
cd ..
kubectl create -f .
kubectldescrobe -n wordpress 
kubectl describe -n wordpress pods wordpress-mydb-0 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl delete -f ./wordpress-mydb-sts-mysql.yaml 
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl get ingress -n wordpress 
kubectl delete -f wordpress-ingress.yaml 
kubectl create -f wordpress-ingress.yaml 
kubectl get ingress -n wordpress 
kubectl create -f wordpress-mydb-cm-mysql.yaml 
kubectl create -f wordpress-mydb-pvc.yaml 
kubectl create -f wordpress-mydb-svc-read.yaml -f wordpress-mydb-svc-write.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get pv,pvc -n wordpress 
kubectl get all -n wordpress 
kubectl get pods,statefulsets -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl delete -f wordpress-mydb-sts-mysql.yaml -n database 
kubectl get all -n database 
kubectl delete -f wordpress-mydb-sts-mysql.yaml
kubectl create -f wordpress-mydb-sts-mysql.yaml
kubectl get all -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml
kubectl create -f wordpress-mydb-sts-mysql.yaml
kubectl get all -n wordpress 
kubectl get pods -n wordpress 
kubectl get all -n wordpress 
kubectl delete -f .
kubectl get pv,pvc
kubectl get all -n wordpress 
kubectl describe -n wordpress pods wordpress-web-deployment-5d89d7b87d-7plbr 
cd ..
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl describe pods -n wordpress wordpress-web-deployment-647bb7d9c5-2wtg2 
kubectl delete -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl delete -f wordpress-deployment.yaml 
cd db/
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
cd ..
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
kubectl delete -f wordpress-deployment.yaml 
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
cd ~/wordpress/
kubectl delete -f wordpress-de
kubectl delete -f wordpress-deployment.yaml 
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl delete -f wordpress-deployment.yaml 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
mysql -u wordpress -p -h wordpress-mydb.wordpress
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get pv,pvc
kubectl get all -n database 
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7,pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl get pv
kubectl delete pv pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl get pv
kubectl delete -f pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7,pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl get pv
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7,pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl get pv
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7,pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7 -f
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7 --f
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7 --force
kubectl get pv
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7,pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f --force
kubectl delete pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7 pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f --force
kubectl get pv
kubectl get pv,pvc
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl delete -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl create -f ./db/wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
kubectl create -f wordpress-deployment.yaml 
kubectl get all -n wordpress 
kubectl get pv,pvc
kubectl get pv
kubectl get all -n wordpress
cd wordpress/
kubectl delete -f wordpress-deployment.yaml 
cd db/
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress
kubectl delete -f .
kubectl get all -n wordpress
cd ..
kubectl delete -f .
kubectl get pv,pvc
kubectl describe pvc data-mydb-0 
kubectl edit pv wordpress-data-wordpress-mydb-0
kubectl edit pv pvc-640f3c2c-04e8-4ec0-b645-903fe08721b7 
kubectl edit pv pvc-767ff679-553e-4bd8-a3f5-9cf4a0a2716f
kubectl get pv
kubectl delete pv pvc-05713ae4-4bf6-4c18-971e-1597adcd5495 pvc-b84ac2bb-60b7-4532-ba3b-47e1bcc97026
kubectl get pv
kubectl edit pv pvc-05713ae4-4bf6-4c18-971e-1597adcd5495
kubectl edit pv pvc-b84ac2bb-60b7-4532-ba3b-47e1bcc97026
kubectl get pv,pvc
kubectl get all
cd db/
kubectl create wordpress-mydb-cm-mysql.yaml 
kubectl create -f wordpress-mydb-cm-mysql.yaml 
kubectl create -f wordpress-mydb-svc-read.yaml -f wordpress-mydb-svc-write.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl describe posd -n wordpress wordpress-mydb-0
kubectl describe pods -n wordpress wordpress-mydb-0
kubectl get all -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n ow
kubectl get all -n wordpress 
kubectl getl all
kubectl get all
kubectl get all -n database 
kubectl get pv,pvc
kubectl get all -n wordpress 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl describe pods -n wordpress wordpress-mydb-0 
kubectl get all -n wordpress 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-pvc.yaml 
kubectl get pvc
kubectl get pvc,pvc
kubectl 
kubectl delete -f wordpress-mydb-pvc.yaml 
kubectl get pvc,pvc
kubectl get pvc,pv
kubectl delete pvc data-mydb-0 data-mydb-1
kubectl get pvc,pv
kubectl delete pv pvc-478605e6-3ef2-4f70-9d01-0ae02a160f50 pvc-5710ba40-22b5-4b5d-a868-920da11089f0 pvc-5710ba40-22b5-4b5d-a868-920da11089f0
kubetl get pv,pvc
kubectl get pv,pvc
kubectl describe pv pvc-8db450a0-c93f-495e-a317-35265591f743
kubectl delete pv pvc-8db450a0-c93f-495e-a317-35265591f743
kubectl get all -n all
kubectl get all -A
kubectl get pv,pvc
kubectl edit pv pvc-478605e6-3ef2-4f70-9d01-0ae02a160f50
kubectl edit pv pvc-5710ba40-22b5-4b5d-a868-920da11089f0 
kubectl edit pv pvc-8db450a0-c93f-495e-a317-35265591f743 
kubectl get pv
kubectl get all -n wordpress 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
kubectl describe statefulsets.apps -n wordpress wordpress-mydb 
kubectl 
kubectl delete -f wordpress-mydb-sts-mysql.yaml 
kubectl create -f wordpress-mydb-sts-mysql.yaml 
kubectl get all -n wordpress 
cd ..
kubectl create -f wordpress-pvc.yaml 
kubectl get pvc
kubectl get pvc -n wordpress 
kubectl delete -n wordpress pvc data-mydb-0
kubectl delete -n wordpress pvc wordpress-data-pvc-wordpress-mydb-0
kubectl delete -n wordpress pvc wordpress-data-pvc-wordpress-mydb-1
kubectl delete -n wordpress pvc wordpress-data-wordpress-mydb-1
kubectl delete -n wordpress pvc wordpress-data-wordpress-mydb--
kubectl delete -n wordpress pvc wordpress-data-wordpress-mydb-0
kubectl create -f wordpress-service.yaml 
kubectl create -f wordpress-deployment.yaml 
kubectl create -f wordpress-ingress.yaml 
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb.wordpress
mysql -u root -h wordpress-mydb-1.wordpress
mysql -u root -h wordpress-mydb-01.wordpress
kubectl get all -n wordpress 
mysql -u root -h wordpress-mydb-1.mydb.wordpress
mysql -u root -h wordoress-mydb-1.wordpress-mydb.wordpress
mysql -u root -h wordpress-mydb-1.wordpress-mydb.wordpress
