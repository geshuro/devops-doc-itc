ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

vi atos-integracam-kp-dev-bastion-devops.pem
chmod 400 atos-integracam-kp-dev-bastion-devops.pem


ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

kubernetes_private_dns = [
  "dev-kubernetes-0-txko.integracam.int",
  "dev-kubernetes-1-txko.integracam.int",
]
kubernetes_private_ip = [
  "10.36.9.41",
  "10.36.9.8",
]
server_security_group_id = [
  "sg-00336ca299d99edd2",
]


######################################################################################
remote
######################################################################################
###
Generar codigo
ssh-keygen -t rsa
###
vi kp-k8s-devops.pem
chmod 400 kp-k8s-devops.pem
ssh -i ~/.ssh/kp-k8s-devops.pem centos@10.36.9.8
ssh -i ~/.ssh/kp-k8s-devops.pem centos@10.36.9.41
###
Copiar ~/.ssh/id_rsa.pub del Bastion DevOps 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0KrQK8Pfs8X7ksn25KJihUqu852guLhdDXTclZSkRgvsnMNEagZR9ozH4EDSH1WFST1SSQQ6/iDxPJpSCEIjMJ4vfhqr8POp808hHTXxFiMnAf+reIUPVNxan3gli1sNj++zRY0YJwM25n78HaAE18J68WrU+wZk+baQFqJkh7J87jHhkleMqvqNVY8hVWbvWykY2qiIWd1wZYDf3FUOfBQpQ0yLot1h4LCxj1k1CdJFEoRlwac3AX/33dd/bUwSgDRNn2w+g7OCQWo06DBESrelaC+7GY7PHHqQp7o0mlZM9gkr5Ene1McXvkK3/bVWH0SI6WH0IwyBiFkk8PqsjPgrO27UE90+1Xx2gDzcaPQY8e5t/vO4TSMHLgOU+xYCZOh7mkyJymEDL7M9qX8gKCxZ5QZ+MIj2F78c0lwnzYQTOIrKGeuMBRsfDggs6oiHvoHKZq8LmwNd7yKFGTlKleR92AtOY+LhLZFuedDjTLxCga6Qrgfb/twm3+/15O90= ubuntu@ip-10-36-9-104
en los nodos kubernetes en el archivo authorized_keys
vi ~/.ssh/authorized_keys




######################################################################################
#/home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh
#montar carpetas containerd storage
#!/bin/bash
sudo mkdir /var/lib/containerd
sudo chmod 711 /var/lib/containerd
sudo mkfs -t xfs /dev/xvdb
sudo mount /dev/xvdb /var/lib/containerd
sudo cp /etc/fstab /etc/fstab.orig
sudo sed -i '$a /dev/xvdb  /var/lib/containerd  xfs  defaults,nofail  0 0'  /etc/fstab
sudo umount /var/lib/containerd
sudo mount -a
df -h

######################################################################################
#Configurar disco para kubernetes
######################################################################################
ssh centos@10.36.9.8 "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  
ssh centos@10.36.9.41 "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  

######################################################################################
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
sudo apt install python3-pip
pip install -r requirements.txt
cp -rfp inventory/sample inventory/myclusterdevops
declare -a IPS=(10.36.9.8 10.36.9.41)
CONFIG_FILE=inventory/myclusterdevops/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
USERNAME=centos
ansible-playbook -i inventory/myclusterdevops/hosts.yaml  -u $USERNAME --become --become-user=root cluster.yml