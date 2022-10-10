ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

postgresql_private_dns = [
  "dev-postgresql-0-snhp.integracam.int",
]
postgresql_private_ip = [
  "10.36.9.102",
]
server_security_group_id = [
  "sg-0cde271d01e03e001",
]

#####################################################################################
remote
######################################################################################
###
Generar codigo
ssh-keygen -t rsa
###
vi ~/.ssh/kp-postgresql-dev.pem
chmod 400 ~/.ssh/kp-postgresql-dev.pem
ssh -i ~/.ssh/kp-postgresql-dev.pem centos@10.36.9.102
###
#Copiar ~/.ssh/id_rsa.pub del Bastion DevOps 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0KrQK8Pfs8X7ksn25KJihUqu852guLhdDXTclZSkRgvsnMNEagZR9ozH4EDSH1WFST1SSQQ6/iDxPJpSCEIjMJ4vfhqr8POp808hHTXxFiMnAf+reIUPVNxan3gli1sNj++zRY0YJwM25n78HaAE18J68WrU+wZk+baQFqJkh7J87jHhkleMqvqNVY8hVWbvWykY2qiIWd1wZYDf3FUOfBQpQ0yLot1h4LCxj1k1CdJFEoRlwac3AX/33dd/bUwSgDRNn2w+g7OCQWo06DBESrelaC+7GY7PHHqQp7o0mlZM9gkr5Ene1McXvkK3/bVWH0SI6WH0IwyBiFkk8PqsjPgrO27UE90+1Xx2gDzcaPQY8e5t/vO4TSMHLgOU+xYCZOh7mkyJymEDL7M9qX8gKCxZ5QZ+MIj2F78c0lwnzYQTOIrKGeuMBRsfDggs6oiHvoHKZq8LmwNd7yKFGTlKleR92AtOY+LhLZFuedDjTLxCga6Qrgfb/twm3+/15O90= ubuntu@ip-10-36-9-104
#en los nodos kubernetes en el archivo authorized_keys
#Entrar comno root y en centos
sudo vi ~/.ssh/authorized_keys

#####################################################################################
Instalar
######################################################################################
###En Bastion devops
sudo apt install sshpass
###Descargar codigo
git clone https://github.com/vitabaks/postgresql_cluster.git
cd /home/ubuntu/postgresql_cluster
######################################################################################
vi inventory
######################################################################################
# if dcs_exists: false and dcs_type: "etcd" (in vars/main.yml)
[etcd_cluster]  # recommendation: 3 or 5-7 nodes
10.36.9.102

# if with_haproxy_load_balancing: true (in vars/main.yml)
[balancers]
10.36.9.102


# PostgreSQL nodes
[master]
10.36.9.102 hostname=pgnode01 postgresql_exists='false'

[replica]
10.36.9.102 hostname=pgnode02 postgresql_exists='false'

[postgres_cluster:children]
master
#replica


# In this example, all components will be installed on PostgreSQL nodes
# You can deploy the etcd cluster and the haproxy balancers on other dedicated servers. 


# if pgbackrest_install: true and "repo_host" is set (in vars/main.yml)
[pgbackrest]  # optional (Dedicated Repository Host)


# Connection settings
[all:vars]
ansible_connection='ssh'
ansible_ssh_port='22'
ansible_user='root'
ansible_ssh_pass='admin'  # "sshpass" package is required for use "ansible_ssh_pass"
# ansible_ssh_private_key_file=
# ansible_python_interpreter='/usr/bin/python3'  # is required for use python3

[pgbackrest:vars]
ansible_user='postgres'
ansible_ssh_pass='secretpassword'


######################################################################################
vi vars/main.yml
######################################################################################
# PostgreSQL variables
postgresql_version: "14"
# postgresql_data_dir: see vars/Debian.yml or vars/RedHat.yml
postgresql_port: "5432"
postgresql_encoding: "UTF8"  # for bootstrap only (initdb)
postgresql_locale: "en_US.UTF-8"  # for bootstrap only (initdb)
postgresql_users: 
  - {name: "administrador", password: "admin2022", flags: "SUPERUSER"}
  - {name: "desarrollo", password: "dev2022", flags: "NOSUPERUSER"}
  - {name: "devops", password: "devops2022", flags: "NOSUPERUSER"}

# (optional) list of databases to be created (if not already exists)
postgresql_databases: 
  - {db: "bddev", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "desarrollo"}
  - {db: "bddevops", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "devops"}

postgresql_schemas: 
  - {schema: "desarrollo", db: "bddev", owner: "desarrollo"}
  - {schema: "devops", db: "bddevops", owner: "devops"}

###
test
###
ansible all -m ping
10.36.9.102 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
###
Instalar
###
ansible-playbook deploy_pgcluster.yml

####
error failed: [10.36.9.102] (item=python3-psycopg2)
####
#Seguir: https://www.crunchydata.com/developers/download-postgres/binaries/psycopg2
#Entrar al servidor remoto como root
# 20221009 no hacer esto porque redhat ya agrego, y mas bien comentar el /etc/yum.repos.d/pgdg-redhat-all.repo ---> [pgdg15] enabled
yum install wget -y
wget https://api.developers.crunchydata.com/downloads/repo/rpm-centos/postgresql14/crunchypg14.repo
wget https://api.developers.crunchydata.com/downloads/gpg/RPM-GPG-KEY-crunchydata-dev
#Mover
mv RPM-GPG-KEY-crunchydata-dev /etc/pki/rpm-gpg
mv crunchypg14.repo /etc/yum.repos.d
#Verificar repos
sudo dnf repolist
#Install EPEL repositories:
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -qy module disable postgresql
sudo dnf list postgresql14

###
Instalar
###
ansible-playbook deploy_pgcluster.yml

####
agregar
##
regla de entrada sg para que bastion vpn y devops tenga acceso al puerto 6432

####
test
####
#instalar ubuntu cliente postgresql
sudo apt install postgresql-client-common
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt -y install postgresql-client-14
psql -h 10.36.9.102 -p 6432 -U desarrollo -c "select pg_is_in_recovery()"
