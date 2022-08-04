sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.171	#master1
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.243	#master2
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.146	#master3
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.161 	#tools1
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.25	#tools2
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.191	#micro1
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.224	#loadbalancer1
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.217	#frontend1


#File System NFS
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-kp-tec-k8s-nfs-rhel.pem" root@10.20.20.26
#montar carpetas
mkdir /shared
mkdir /shared/disk1
mkdir /shared/tools

mkfs -t xfs /dev/xvdb
mkfs -t xfs /dev/xvdc

mount /dev/xvdb /shared/disk1
mount /dev/xvdc /shared/tools

sudo cp /etc/fstab /etc/fstab.orig

sed -i '$a /dev/xvdb  /shared/disk1  xfs  defaults,nofail  0 0'  /etc/fstab
sed -i '$a /dev/xvdc  /shared/tools  xfs  defaults,nofail  0 0'  /etc/fstab

umount /shared/disk1
umount /shared/tools
mount -a

#NFS - server
yum -y install nfs-utils libnfsdimap
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start enable 
systemctl start nfs-server
systemctl start rpc-statd
systemctl start nfs-idmapd

chmod  777 /shared/
chmod  777 /shared/disk1
chmod  777 /shared/tools
vi /etc/exports
...
/shared/tools 10.20.20.0/24(rw,sync,no_root_squash)
/shared/disk1 10.20.20.0/24(rw,sync,no_root_squash)
...
exportfs -r
showmount -e localhost
...
Export list for localhost:
/shared/disk1 10.20.20.0/24
/shared/tools 10.20.20.0/24
...

#configure nfs cliente
#server: cliente
yum install -y nfs-utils libnfsdimap
systemctl enable rpcbind
systemctl start rpcbind
showmount -e 10.20.20.26
...
Export list for 10.20.20.26:
/shared/disk1 10.20.20.0/24
/shared/tools 10.20.20.0/24
...
mkdir /shared
mkdir /shared/tools
mount 10.20.20.26:/shared/tools /shared/tools
df -kh
...
10.20.20.26:/shared/tools       50G   33M   50G   1% /shared/tools
...
#persistir montaje
sed -i '$a 10.20.20.26:/shared/tools  /shared/tools  nfs  rw,sync,hard,intr  0 0'  /etc/fstab
umount /shared/tools
mount -a
mount -av
reboot
######################################################################################
#init k8s remoto
#!/bin/bash
sudo subscription-manager register --username cdnunez --password 2020ArquitecturaCloud --auto-attach
sudo subscription-manager repos --enable rhel-7-server-ansible-2.9-rpms
#crear usuario admcuc
adduser admcuc; echo admcuc | passwd admcuc --stdin; usermod -aG wheel admcuc
systemctl stop firewalld; systemctl disable firewalld; systemctl mask --now firewalld; systemctl status firewalld

######################################################################################
#ejecutar init k8s remoto
#master "bash -s" -- < init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.139 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.69 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.126 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.42 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.197 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.236 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-8s-cuc-test.pem" root@10.20.20.35 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.135 "bash -s" -- < /tmp/k8s/init_k8s.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-k8s-cuc-test.pem" root@10.20.20.204 "bash -s" -- < /tmp/k8s/init_k8s.sh 

#configure nfs cliente
#server: cliente
yum install -y nfs-utils libnfsdimap
systemctl enable rpcbind
systemctl start rpcbind

#montar nfs share en cliente
[root@S00RLXPLANT001 /]# showmount -e 10.20.20.138
...
Export list for 10.20.20.138:
/shared 10.20.20.0/24
...
[root@S00RLXPLANT001 /]# mkdir /shared
[root@S00RLXPLANT001 /]# mkdir /shared/tools
[root@S00RLXPLANT001 /]# mount 10.20.20.138:/shared /shared/tools
[root@S00RLXPLANT001 /]# df -kh
...
10.20.20.138:/shared           100G   32M  100G   1% /shared
...


#Git
git add .
git commit -m "Aprovisionador PV local nodegroups"
git push origin sunat-cuc-k8s-ansiblerole

#Proxy sunat
vi /etc/rhsm/rhsm.conf
proxy_hostname =10.20.20.6
proxy_port =3128

vi /etc/yum.conf
...
proxy=http://10.20.20.66:3128

kubectl create -f 01-namespace.yaml


sysctl -w vm.max_map_count=262144

#label en nodo por validacion de elastic anidado
kubectl label nodes tools1 tools=sonarqube
kubectl label nodes tools1 zeebe=true



journalctl --unit=docker -n 100 --no-pager

######################################################################################
#configure nfs cliente -- /tmp/k8s/k8s_client_nfs_tools.sh 
#!/bin/bash
yum install -y nfs-utils libnfsdimap
systemctl enable rpcbind
systemctl start rpcbind
mkdir /shared
mkdir /shared/tools
mount 10.20.20.26:/shared/tools /shared/tools
sed -i '$a 10.20.20.26:/shared/tools  /shared/tools  nfs  rw,sync,hard,intr  0 0'  /etc/fstab
umount /shared/tools
mount -a
mount -av

######################################################################################
#configure nfs cliente -- /tmp/k8s/k8s_client_nfs_micro.sh 
#!/bin/bash
yum install -y nfs-utils libnfsdimap
systemctl enable rpcbind
systemctl start rpcbind
mkdir /shared
mkdir /shared/disk1
mount 10.20.20.26:/shared/disk1 /shared/disk1
sed -i '$a 10.20.20.26:/shared/disk1  /shared/disk1  nfs  rw,sync,hard,intr  0 0'  /etc/fstab
umount /shared/disk1
mount -a
mount -av

######################################################################################
#init 
#montar carpetas docker storage
#!/bin/bash
sudo mkdir /var/lib/docker
sudo chmod 711 /var/lib/docker
sudo mkfs -t xfs /dev/xvdb
sudo mount /dev/xvdb /var/lib/docker
sudo cp /etc/fstab /etc/fstab.orig
sudo sed -i '$a /dev/xvdb  /var/lib/docker  xfs  defaults,nofail  0 0'  /etc/fstab
sudo umount /var/lib/docker
sudo mount -a
df -h

######################################################################################
#ejecutar init docker storage k8s remoto
#master "bash -s" -- < init_k8s_docker_storage.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.171 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.243 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.146 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.161 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.25 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.191 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.224 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh  
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.217 "bash -s" -- < /tmp/k8s/init_k8s_docker_storage.sh 
######################################################################################
#configure nfs cliente -- /tmp/k8s/k8s_client_nfs_tools.sh 
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.35 "bash -s" -- < /tmp/k8s/k8s_client_nfs_tools.sh   
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.135 "bash -s" -- < /tmp/k8s/k8s_client_nfs_tools.sh   
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.204 "bash -s" -- < /tmp/k8s/k8s_client_nfs_tools.sh   

######################################################################################
#configure nfs cliente -- /tmp/k8s/k8s_client_nfs_micro.sh
sshpass -p indra2020 ssh -i "/tmp/kp/kp-tec-devops-shared2.pem" root@10.20.20.236 "bash -s" -- < /tmp/k8s/k8s_client_nfs_micro.sh 



######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
#Crear cluster
ansible-playbook -b -v -i inventory/prod/hosts_cuc_v1.yaml cluster.yml -Kk
subscription-manager remove --all
######################################################################################
#Agregar nodo
ansible-playbook -b -v -i inventory/prod/hosts_cuc_v1.yaml scale.yml -Kk --limit tools3
######################################################################################
#Creacion usuario
ansible-playbook -b -v -i inventory/prod/hosts_cuc_v1.yaml cluster_usuario.yml -Kk

######################################################################################
#Crear local_volume_provisioner
ansible-playbook -b -v -i inventory/prod/hosts_cuc_v1.yaml cluster_provisionador.yml -Kk

######################################################################################
#Reiniciar cluster
ansible-playbook -b -v -i inventory/prod/hosts.yaml reiniciar.yml -Kk

######################################################################################
#devops
sshpass -p indra2020 ssh -i "/tmp/kp/kp-shared-tec-bastion-devops-tec.pem" root@10.20.1.27

#bastion test
sshpass -p indra2020 ssh -i "/tmp/kp/kp-test-bastion.pem" root@10.20.1.76
