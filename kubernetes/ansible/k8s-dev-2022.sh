ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

oquvexZfnzeaht}s

vi atos-integracam-kp-dev-bastion-devops.pem
chmod 400 atos-integracam-kp-dev-bastion-devops.pem


ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

kubernetes_private_dns = [
  "dev-kubernetes-0-revw.integracam.int",
  "dev-kubernetes-1-revw.integracam.int",
]
kubernetes_private_ip = [
  "10.36.9.69",
  "10.36.9.18",
]
server_security_group_id = [
  "sg-046e55e3e53486f43",
]


######################################################################################
remote
######################################################################################
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub centos@10.36.9.18

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
ssh centos@10.36.9.18 "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  
ssh centos@10.36.9.69 "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  

######################################################################################
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
sudo apt install python3-pip
pip install -r requirements.txt
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(10.36.9.18 10.36.9.69)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
USERNAME=centos
ansible-playbook -i inventory/mycluster/hosts.yaml  -u $USERNAME --become --become-user=root cluster.yml