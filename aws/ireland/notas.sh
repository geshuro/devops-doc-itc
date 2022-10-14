###################################################################
########## RemoteState - Ireland
###################################################################
dynamodb_table_name_arn = "arn:aws:dynamodb:eu-west-1:841131224287:table/tf-up-and-running-locks-eu-west-1-jjci"
dynamodb_table_name_id = "tf-up-and-running-locks-eu-west-1-jjci"
s3_bucket_arn = "arn:aws:s3:::s3-devsysops-841131224287-eu-west-1-jjci"
s3_bucket_domain_name = "s3-devsysops-841131224287-eu-west-1-jjci.s3.amazonaws.com"
s3_bucket_id = "s3-devsysops-841131224287-eu-west-1-jjci"

###################################################################
########## Datos de Local - RemoteState
###################################################################
locals {
  region  = "eu-west-1" //Region donde se desplegaran la infraestructura
  profile = "atos-integracam-tf-desarrollo-ireland" //El perfil cuenta con los permisos para desplegar la infraestructura
  # Los tags que se asociaran en los recursos que se van a crear.
  common_tags = {
    CostCenter  = "ESTE-VALOR-NO-ESTA-IDENTIFICADO-AUN" // "identificador-unico-sin-espacios"
    CostCenterId = "ESTE-VALOR-NO-ESTA-IDENTIFICADO-AUN"
    EntityName  = "ATOS" //"Nombre de la Entidad a la que se suscribe el recurso"
    EntityId    = "ESTE-VALOR-NO-ESTA-IDENTIFICADO-AUN" //"id-de-la-entidad-sin-espacios"
    ProjectName = "integracam" //"Nombre del proyecto"
    ProjectId   = "ESTE-VALOR-NO-ESTA-IDENTIFICADO-AUN" //"id-del-proyecto-sin-espacios"
    Environment = "all" //"all"
  }
}
###################################################################
########## Datos de VPC Shared
###################################################################
bastion-nat-subnet-cidrblock = [
  "10.36.8.0/28",
  "10.36.8.16/28",
]
eip_nat-public_ip = [
  "18.200.40.99",
  "52.48.251.161",
]
internal_service_domain = "atos-integracam.int"
internal_service_domain_id = [
  "Z08995941R5S5BAXFUMRU",
]
vpc_arn = "arn:aws:ec2:eu-west-1:841131224287:vpc/vpc-017a03e00e2933b0e"
vpc_cidr_block = "10.36.8.0/23"
vpc_cidr_name = "vpcshared-hsi"
vpc_id = "vpc-017a03e00e2933b0e"

###################################################################
########## Datos de VPC Dev
###################################################################
vpc_arn = "arn:aws:ec2:eu-west-1:841131224287:vpc/vpc-0900cc25d4e08abd8"
vpc_cidr_block = "10.36.10.0/23"
vpc_cidr_name = "vpcdev-npu"
vpc_id = "vpc-0900cc25d4e08abd8"
vpc_peering_shared_id = "pcx-0a0bf0d4a165dcc79"
vpc_peering_shared_status = "active"
###################################################################
########## Datos de VPC Release
###################################################################
vpc_arn = "arn:aws:ec2:eu-west-1:841131224287:vpc/vpc-09ce355d5837a20aa"
vpc_cidr_block = "10.36.12.0/23"
vpc_cidr_name = "vpcrelease-tab"
vpc_id = "vpc-09ce355d5837a20aa"
vpc_peering_shared_id = "pcx-01037a14263dcdfb1"
vpc_peering_shared_status = "active"
###################################################################
########## Datos de Bastion Shared
###################################################################
bastion_launch_config_arn = "arn:aws:autoscaling:eu-west-1:841131224287:launchConfiguration:e325238f-ce09-4ecb-9b3b-78cd586c9359:launchConfigurationName/asg-shared-bastion-yuyr-20221007103657249300000002"
bastion_launch_config_id = "asg-shared-bastion-yuyr-20221007103657249300000002"
bastion_launch_config_name = "asg-shared-bastion-yuyr-20221007103657249300000002"
bastion_sg_id = "sg-0f04534f4ae931f70"
bastion_sg_name = "shared-bastion-20221007103647017800000001"
bastion_vpc_id = "vpc-017a03e00e2933b0e"
eip_bastion = "54.72.95.186"
key_name = "kp-shared-bastion"
private_key_filename = "./secret/kp-shared-bastion"
ssm_parameter_arn = "arn:aws:ssm:eu-west-1:841131224287:parameter/Shared/keypair/kp-shared-bastion/ssh-public"
#llave privada de ec2
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAreK0vzm+ecjfDsEKJgy93MOzAA82+tbQTB9CF889nMC5hoev
LS33WGzzns+yO0jq4BLMf9+5ra2NfAbixhBj7RR8i3GQiT5w0lA6n5rMbIdsJ1Re
nMkqwnD7d/8YfeiTddzK/9GOj3bS4hr9vkr7J0zmhKeeRRsYuACdgYoAVHQcRc1w
jknb/ddOif/S3jtqq+usr7hhsXSjG2EVu33ddbFDlyyMXj1sgC3fm2bcnCPulApP
cP2jql/alJYEFacjyNf01KA0M1fFQPvKB3YDgQUSMlnIK4taqM6JcYbU41nJsbFk
iht6GE2H5uNHoUId1kHOIJLStWc12XGy9wPoWQIDAQABAoIBAFj5+6EqLBRnO/Rx
xP6pYHHZ1ft+zZRXXWjGSeyjCBTw7T4wqevFbJ7byWGHR91cN4uHMwtv8LQ1bYN8
hofxFSDYbc5wwxPnVpXXpdfLvzT9qtMJMgyqR24NoC/L4b1zyBj0bQ+wLHGuzMQU
Kak49wEqMX7Jwov8DI8DCZWihv6vPrhQXTS/fduSGaWJR7Jm+bMyBASz/ZeAHafp
6dcsPqTDcoz0mbfqcsBWZ140IJOqTfgJOjZkrbhr5mOtLj6F0dUYZqtvjigVjnNk
jHpVZaamZXZ2bXuRd+pxXPPQRpBBENvroBTHMO9wEv8jUGFDqa+Vk49naZhvsUek
GawVg/ECgYEA5HyElgXnZzh5dZJcpn92Gc9WyHOqy0iZBCgLrctQ1WVr4LoccgFh
OwfARYVWmYm2qw0nF+kt/kdbtDwTsmseX2BHhRgiW2/o1gOMGD6cQeTBKvwE2Wd6
377EWs0SUZbMai5pvfnMCqJGOEnxhHLUTsRySvduxWtpDuwbettTEFUCgYEAwtMG
UitG+jebYc5ma/B8zyGb1jDFLbVEWRffUgVWEI1jee4KEyMf0uGmxhcqqVIlrTjc
YAfibKLgP9iN6GIBP7+oGG/uKooi2B4XhGrux6nmHP5YoLuo8GJQ6A8NTvcWPSkm
v7bMRAcIZjkJzB+wDjT8NwGDjv8QjzHgv2SrK/UCgYAxzYZk4QKQeDnZS77QN+Y5
N/11kei/iKJ5ynTJPBDxgrrh8A81NmHIKSdav/ahXugnHqXPy27QByPRBGtSr5Ce
P3E3bIxIm/sHcxx9SGBs6HzGbsprzOd2j7FjDWIZ0KHb3yQDWciE5NwjdtKjCRiH
1sAG4SoO9BuhOgu/WsEfRQKBgQCxogp/XOooNg88TB5iiDCkAra9wlXl6QJaYUPC
2w6vpNpwT7Nr43iepBOVRYYmP7oOiGuWO1odRxxD2kT4/nK5FxxCu7thmfVPK5Cx
sXXpImWnRdi1JKVSF7JBA4hU2UCznxOvdRIlbGwiGBtwu+uf6HuWA5FaDgGhLg8H
MthHCQKBgQDONLm6K5cLEDbZxETjcjMtJIfvN7w4xxFnQ/D2yHFQsNiwSRU2eIjP
sjsb+IjxVI9nbvJ/hU4mMGGSc3xAx0ALE6JVUpkVqdjri93BlBzWRuavwqG4q6oD
mINs1Jr+zAfCvOFpGTOhY+kRn3ApA7UX1vT7ymo8CB64SuQ7JU3/RQ==
-----END RSA PRIVATE KEY-----
#remotear
ssh -i "atos-integracam-kp-shared-bastion.pem" ec2-user@54.72.95.186
#crear certificados
sudo /usr/bin/import_users.sh
#bucket 
s3-devsysops-841131224287-eu-west-1-jjci
#clave para descomprimir certificado openvpn
dsdbIx6_<eqibrtd

###################################################################
########## Datos de Bastion DevOps Shared
###################################################################
instance_id = "i-014cf0ccee7009d0e"
instance_private_dns = "shared-bastion-devops.atos-integracam.int"
instance_private_ip = "10.36.9.49"
#llave privada de ec2
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAq7rDIRKy5RSl8tNaP8U7sg5DshG6seY3lt5afAG2qyt5FtYT
37Rcb2AaICbLn3gHBhLQdKNDJmhCBnql+OW/swXf5jDCs/jT+m2xVxdgADhOn+ab
wYLlbksyio4bIelqrMWoRixAQWH/nebKslvBrvOejONuJ5eJeJhvjVRK/PIRhMq7
B9KHluk9Pp15M9vQWI55FLcr+sJYDkr7TfcK06cIiIBqkpgrb4apbiwbaOia028O
FFjnxBEso7sVUvVxqM6hnOlMhoPaMc94HJt88SlTFiqE457lKqzM43BXqMz7iu85
kkUik/O3d+r6x3lEpZYap0Y7yTeUzbQCAKyBQQIDAQABAoIBADbbXw/GkFz7PpOW
DkNGtu4G/nr4jOHdP66y8sagKYD+Tx0LX6fbTpfJZC8XFX6ocd3vzqUjrgSr00OM
lE4w3g7K9p3qv5eMCfL6bWb7sZAAbKVJnkGvlaio3slB4crwbEIqlbls003Phz8i
hWd6RiGj8ubgk8ST9LcQQrorzhSEnTqq0nGZxKO3ZuP7NNMIznZHzn0IZumZ8OWQ
0MOf7LK5Gpe/77k/H1rR72dNdiPlsB+FtO8f9nvE08gf+KnlavPDM629D6QkxgPq
4Tz2Umlgt7bypqrMewHb5PY7LKqRxHy19nqb+Wu+K5uKw0djSvOqhVKl2LyIkiya
TaRefJ0CgYEAzzs2mEGs236nzgGyF1ZYlZ8LnI6lpK1hoEkNWPz1KCxYwfAknHYW
GIVXpdIMd3gN7qsbPh/sJ/QcupsNeHyK4EAmNSKxPT9BmK4uKm8lGlMkqpGZHG3Q
Js9pMjSCHJmdtt3p+N2r2o8FDyOQPRjtRmVTO7HY8O9jmwarsOmwSF8CgYEA1CS4
y4UNnb64I8KS6ahr9w1SImX4b8mCY3lz/0VSJe0FmVVzcuwowDce6Br+fwgHampc
yEcHRWwbVka0CPyLD34tiTC0mby4Eupyd4/Aw/ucuoWjvjZBU0sZdJQNEmD5f+du
ArBJ8Y5lV2TMCd/q92dWUGk6Ivg8ciOFjmgYGl8CgYBzrjJDvCWqQYGa1gd8T48T
trzcoCSHUOH2f9Ebo9mWm2rQmCVX0fNzrLvIrQCYkEP2vz1t6JQDmZmP8Y4LfDpq
BGVPtBYMgoszl8fdmD21/EOzk6NM42AWyiGHDRi0rmwD8MzzR4rvbnb8hHW4JXoO
mfFkmVro5DlOCOM+1rS5MQKBgFo4w97KV2AfHHEY7yIwXrpTD/tRIrdoG+vyW0LV
WHqIszji/paBmVMmHh7YXCPqZjz7vznt+0mrEHVA3JB11y5fmz4dWLGJcT+aNdRj
brfq6lzpORpMOLwT1F+gF28ZjwK2ijLahpgU10SzuZL5iBRv/mV0WyVELXDdao+F
9bpBAoGBALVpTKujnj7NPrGhIYK5WucHoVEGIQKbABB6mhJRNV+FwZpE+gg+mqFs
6RHf5kG3MC0+Smn/lu6uEVlRhwXGTUJwOzcJ0A3BOmcJzscWO5KWcgwLdXC/a+DT
iN0PgrFcY6RFZEk9xNpVGob9u6fOra4S5tcGBqNoFTKAGxXyf2Ay
-----END RSA PRIVATE KEY-----
#activar vpn
#remotear
ssh -i "atos-integracam-kp-shared-bastion-devops.pem" ubuntu@shared-bastion-devops.atos-integracam.int

###################################################################
########## Datos de EKS DevOps Shared
###################################################################
El proyecto terraform EKS instala tambien aws-eks-alb-ingress con helmchart y
el aws-ebs-csi-driver mediante la funcion add-ons terraform.
# output
cluster_endpoint = "https://280CA49E40D49B2A96ABC2915C7B4E19.gr7.eu-west-1.eks.amazonaws.com"
cluster_security_group_id = "sg-0eb5a9fac8c10d819"
config_map_aws_auth = <<EOT
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::841131224287:role/eks-devops-eks-node-group-20221009054652330300000008
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes

EOT
node_groups = {
  "eks-devops" = {
    "iam_role_arn" = "arn:aws:iam::841131224287:role/eks-devops-eks-node-group-20221009054652330300000008"
    "iam_role_name" = "eks-devops-eks-node-group-20221009054652330300000008"
    "iam_role_unique_id" = "AROA4HV2T5TPY5Y7VEVE4"
    "launch_template_arn" = "arn:aws:ec2:eu-west-1:841131224287:launch-template/lt-0ea085de74e8a32a9"
    "launch_template_id" = "lt-0ea085de74e8a32a9"
    "launch_template_latest_version" = 1
    "launch_template_name" = "eks-devops-20221009060008899200000010"
    "node_group_arn" = "arn:aws:eks:eu-west-1:841131224287:nodegroup/eks-devops-R4SM0zGw/eks-devops-20221009060010713600000012/22c1ddaa-2ceb-99c6-37dd-64f82bcef079"
    "node_group_autoscaling_group_names" = [
      "eks-eks-devops-20221009060010713600000012-22c1ddaa-2ceb-99c6-37dd-64f82bcef079",
    ]
    "node_group_id" = "eks-devops-R4SM0zGw:eks-devops-20221009060010713600000012"
    "node_group_labels" = tomap({
      "Environment" = "shared"
    })
    "node_group_resources" = tolist([
      {
        "autoscaling_groups" = tolist([
          {
            "name" = "eks-eks-devops-20221009060010713600000012-22c1ddaa-2ceb-99c6-37dd-64f82bcef079"
          },
        ])
        "remote_access_security_group_id" = ""
      },
    ])
    "node_group_status" = "arn:aws:eks:eu-west-1:841131224287:nodegroup/eks-devops-R4SM0zGw/eks-devops-20221009060010713600000012/22c1ddaa-2ceb-99c6-37dd-64f82bcef079"
    "node_group_taints" = toset([])
    "security_group_arn" = "arn:aws:ec2:eu-west-1:841131224287:security-group/sg-099f84ec9c5df713d"
    "security_group_id" = "sg-099f84ec9c5df713d"
  }
}
region = "eu-west-1"
###################################################################
########## Datos de PostgreSQL Shared
###################################################################
#output
postgresql_private_dns = [
  "shared-postgresql.atos-integracam.int",
]
postgresql_private_ip = [
  "10.36.9.44",
]
server_security_group_id = [
  "sg-08464bcc68508368b",
]
###################################################################
########## Datos de PostgreSQL Dev
###################################################################
#output
postgresql_private_dns = [
  "dev-postgresql.atos-integracam.int",
]
postgresql_private_ip = [
  "10.36.11.105",
]
server_security_group_id = [
  "sg-026e812bb68b0f7ac",
]
###################################################################
########## Datos de PostgreSQL Release
###################################################################
#output
postgresql_private_dns = [
  "release-postgresql.atos-integracam.int",
]
postgresql_private_ip = [
  "10.36.13.56",
]
server_security_group_id = [
  "sg-041e57d3495b8e6fc",
]
###################################################################
########## Datos de Kubernetes Dev
###################################################################
#output
kubernetes_private_dns = [
  "dev-k8s-0.atos-integracam.int",
  "dev-k8s-1.atos-integracam.int",
]
kubernetes_private_ip = [
  "10.36.11.116",
  "10.36.11.11",
]
server_security_group_id = [
  "sg-001510f7e8183418c",
]
###################################################################
########## Datos de Kubernetes Release
###################################################################
#output
kubernetes_private_dns = [
  "release-k8s-0.atos-integracam.int",
  "release-k8s-1.atos-integracam.int",
]
kubernetes_private_ip = [
  "10.36.13.97",
  "10.36.13.23",
]
server_security_group_id = [
  "sg-0cefdf4f31431de17",
]

###################################################################
########## Remotear
###################################################################
#conectar a bastion devops
ssh -i "atos-integracam-kp-shared-bastion-devops.pem" ubuntu@shared-bastion-devops.atos-integracam.int
#Generar codigo
ssh-keygen -t rsa
#copiar certificados privados rsa a bastion devops
#postgresql shared
vi kp-shared-kp-shared-postgresql-ttyt.pem
chmod 400 kp-shared-kp-shared-postgresql-ttyt.pem
ssh -i "kp-shared-kp-shared-postgresql-ttyt.pem" centos@shared-postgresql.atos-integracam.int
#postgresql dev
vi kp-dev-kp-dev-postgresql-qgmn.pem
chmod 400 kp-dev-kp-dev-postgresql-qgmn.pem
ssh -i "kp-dev-kp-dev-postgresql-qgmn.pem" centos@dev-postgresql.atos-integracam.int
#postgresql release
vi kp-release-kp-release-postgresql-qhag.pem
chmod 400 kp-release-kp-release-postgresql-qhag.pem
ssh -i "kp-release-kp-release-postgresql-qhag.pem" centos@release-postgresql.atos-integracam.int
#Kubernetes release
#nodo-0-1
vi kp-release-kp-release-kubernetes-vcwy.pem
chmod 400 kp-release-kp-release-kubernetes-vcwy.pem
ssh -i "kp-release-kp-release-kubernetes-vcwy.pem" centos@release-k8s-0.atos-integracam.int
ssh -i "kp-release-kp-release-kubernetes-vcwy.pem" centos@release-k8s-1.atos-integracam.int
ssh root@release-k8s-0.atos-integracam.int
ssh root@release-k8s-1.atos-integracam.int
#Kubernetes dev
#nodo-0-1
vi kp-dev-kp-dev-kubernetes-exjv.pem
chmod 400 kp-dev-kp-dev-kubernetes-exjv.pem
ssh -i "kp-dev-kp-dev-kubernetes-exjv.pem" centos@dev-k8s-0.atos-integracam.int
ssh -i "kp-dev-kp-dev-kubernetes-exjv.pem" centos@dev-k8s-1.atos-integracam.int
ssh root@dev-k8s-0.atos-integracam.int
ssh root@dev-k8s-1.atos-integracam.int

#copiar ~/.ssh/id_rsa.pub del Bastion DevOps 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCaN36WO6WgqMuIeYEUYDkA81+xdh9TgIdKxpibb4byS8+t56xtkCg4VToEWPnaVoznpxaf3rywExcRwRXhWySwGy3lhyemi0k+xN07s72gKreWZyUyZYr1iKcXqMP0gKXfg7SporQ31+m3suS6vEzUF9cm2XptEMN5dRdyTTVb9XHfcx4femrkiz638aKMGQ9+zfeJStkl2s7jeUsas3LC8E0Mh++L+sZRS0ex2b6mqyVZZC2uw6Z8JgUVtqmBl8Si+J0AeWQ4z9W5oQo882PZStoaMGLe2P3lJn0UYRCVS1oo5/W43rwY6Gi5aCi/g1WEdfRKB0ztHTOOBNP0C+bd3dpJlhsE4B/L7qkWtRXLFuThX4VWDe+KA1P+omdQ22HlmcOjBBK/rbwmqbe5Q3TUhS0+1aUezXko45DlFue/ZV4CnvgNOIWe/hFldp7jG9QspRv9knebg+osZ+u1fu5VjapNTzp3shJXKNxbjEN8RHDCUf5+Aat2LXTDi9bdLY0= ubuntu@ip-10-36-9-49
#en los nodos en el archivo authorized_keys como root
sudo su -
vi ~/.ssh/authorized_keys

#luego remtear desde bastion
ssh centos@shared-postgresql.atos-integracam.int
ssh centos@dev-postgresql.atos-integracam.int
ssh centos@release-postgresql.atos-integracam.int

#instalar
sudo apt install sshpass

###################################################################
########## Ansible PostgreSQL
###################################################################
###Descargar codigo
git clone https://github.com/vitabaks/postgresql_cluster.git
cd /home/ubuntu/postgresql_cluster
###Editar inventario
vi inventory
###Editar variables
vi vars/main.yml

postgresql_users: 
  - {name: "administrador", password: "admin2022", flags: "SUPERUSER"}
  - {name: "devops", password: "devops2022", flags: "NOSUPERUSER"}

postgresql_databases: 
  - {db: "sonarqube", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "devops"}
  - {db: "artifactory-oss", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "devops"}
  - {db: "artifactory-jcr", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "devops"}
  - {db: "keycloak", encoding: "UTF8", lc_collate: "en_US.UTF-8", lc_ctype: "en_US.UTF-8", owner: "devops"}

postgresql_schemas: 
  - {schema: "devops", db: "sonarqube", owner: "devops"}
  - {schema: "devops", db: "artifactory-oss", owner: "devops"}
  - {schema: "devops", db: "artifactory-jcr", owner: "devops"}
  - {schema: "devops", db: "keycloak", owner: "devops"}

#Entrar al servidor remoto como root
ssh centos@shared-postgresql.atos-integracam.int
yum install wget -y
wget https://api.developers.crunchydata.com/downloads/repo/rpm-centos/postgresql14/crunchypg14.repo
wget https://api.developers.crunchydata.com/downloads/gpg/RPM-GPG-KEY-crunchydata-dev
#Mover
mv RPM-GPG-KEY-crunchydata-dev /etc/pki/rpm-gpg
mv crunchypg14.repo /etc/yum.repos.d
#Verificar repos
sudo dnf repolist
#Install EPEL repositories:
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf -qy module disable postgresql
sudo dnf list postgresql14

#########
#Instalar
#########
ansible-playbook deploy_pgcluster.yml

######
#Error
######
#Si sale este error
TASK [packages : Install system packages] ********************************************************************************************************************
failed: [10.36.11.105] (item=['python2', 'python3-libselinux', 'python3-libsemanage', 'python3-policycoreutils']) => {"ansible_loop_var": "item", "changed": false, "item": ["python2", "python3-libselinux", "python3-libsemanage", "python3-policycoreutils"], "msg": "Failed to download metadata for repo 'pgdg15': Yum repo downloading error: Downloading error(s): repodata/987a6a26234ec43aa72b677bfa5421659d0162b65d48493a9c472476964628c0-primary.xml.gz - Cannot download, all mirrors were already tried without success; repodata/e46fadc99888da3ddd69c9b00b216e9278b83f062ee9d6a399dffc69143b9c62-filelists.xml.gz - Cannot download, all mirrors were already tried without success", "rc": 1, "results": []}
failed: [10.36.11.105] (item=python3) => {"ansible_loop_var": "item", "changed": false, "item": "python3", "msg": "Failed to download metadata for repo 'pgdg15': Yum repo downloading error: Downloading error(s): repodata/987a6a26234ec43aa72b677bfa5421659d0162b65d48493a9c472476964628c0-primary.xml.gz - Cannot download, all mirrors were already tried without success; repodata/e46fadc99888da3ddd69c9b00b216e9278b83f062ee9d6a399dffc69143b9c62-filelists.xml.gz - Cannot download, all mirrors were already tried without success", "rc": 1, "results": []}
failed: [10.36.11.105] (item=python3-devel) => {"ansible_loop_var": "item", "changed": false, "item": "python3-devel", "msg": "Failed to download metadata for repo 'pgdg15': Yum repo downloading error: Downloading error(s): repodata/987a6a26234ec43aa72b677bfa5421659d0162b65d48493a9c472476964628c0-primary.xml.gz - Cannot download, all mirrors were already tried without success; repodata/e46fadc99888da3ddd69c9b00b216e9278b83f062ee9d6a399dffc69143b9c62-filelists.xml.gz - Cannot download, all mirrors were already tried without success", "rc": 1, "results": []}
#solucion
# 20221009  comentar el /etc/yum.repos.d/pgdg-redhat-all.repo ---> [pgdg15] enabled=0
# en server remoto

##################
#Re- Instalar
##################
ansible-playbook deploy_pgcluster.yml

###################################################################
########## Ansible Kubernetes - KubeSpray
###################################################################
#release
kubernetes_private_dns = [
  "release-k8s-0.atos-integracam.int",
  "release-k8s-1.atos-integracam.int",
]
kubernetes_private_ip = [
  "10.36.13.97",
  "10.36.13.23",
]
ssh root@release-k8s-0.atos-integracam.int
ssh root@release-k8s-1.atos-integracam.int
#dev
kubernetes_private_dns = [
  "dev-k8s-0.atos-integracam.int",
  "dev-k8s-1.atos-integracam.int",
]
kubernetes_private_ip = [
  "10.36.11.116",
  "10.36.11.11",
]
ssh root@dev-k8s-0.atos-integracam.int
ssh root@dev-k8s-1.atos-integracam.int
######################################################################################
#Crear y ejecutar remotamente
######################################################################################
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
ssh centos@release-k8s-0.atos-integracam.int "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  
ssh centos@release-k8s-1.atos-integracam.int "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  

ssh centos@dev-k8s-0.atos-integracam.int "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  
ssh centos@dev-k8s-1.atos-integracam.int "bash -s" -- < /home/ubuntu/kubernetes-util/init_k8s_containerd_storage.sh  

######################################################################################
#Ansible role Kubernetes
######################################################################################
git clone https://github.com/kubernetes-sigs/kubespray.git
#configurar release
cd kubespray
sudo apt install python3-pip
pip install -r requirements.txt
cp -rfp inventory/sample inventory/release
declare -a IPS=(10.36.13.97 10.36.13.23)
CONFIG_FILE=inventory/release/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
USERNAME=centos
ansible-playbook -i inventory/release/hosts.yaml  -u $USERNAME --become --become-user=root cluster.yml
#configurar dev
cd kubespray
sudo apt install python3-pip
pip install -r requirements.txt
cp -rfp inventory/sample inventory/dev
declare -a IPS=(10.36.11.116 10.36.11.11)
CONFIG_FILE=inventory/dev/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
USERNAME=centos
ansible-playbook -i inventory/dev/hosts.yaml  -u $USERNAME --become --become-user=root cluster.yml

######################################################################################
#Obtener credenciales Kubernetes
######################################################################################
#release
ssh root@release-k8s-0.atos-integracam.int
ssh root@release-k8s-1.atos-integracam.int
#dev
ssh root@dev-k8s-0.atos-integracam.int
ssh root@dev-k8s-1.atos-integracam.int
cat .kube/config







######################################################################################
#Configurar EKS DevOps ebs-csi-controller-sa
######################################################################################
#instalar eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
# porque luego de ejecutar el proyecto terraform de EKS dEvops, se detecto que falto 
# atachar un rol AIM al ebs-csi-controller para que tenga permiso y crea los PVC
# sino no podrea crear PVC y no se iniciara el pod
eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster eks-devops-R4SM0zGw \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole
# entrar a la consola aws EKS - addons
# editar aws-ebs-csi-driver y enlazar al nuevo rol adicionado
## verificar que el sa de ebs-csi-controller-sa tenga en su anotacion el rol asignado
## kubectl describe sa ebs-csi-controller-sa -n kube-system
Name:                ebs-csi-controller-sa
Namespace:           kube-system
Labels:              app.kubernetes.io/component=csi-driver
                     app.kubernetes.io/managed-by=EKS
                     app.kubernetes.io/name=aws-ebs-csi-driver
                     app.kubernetes.io/version=1.11.4
Annotations:         eks.amazonaws.com/role-arn: arn:aws:iam::841131224287:role/AmazonEKS_EBS_CSI_DriverRole
Image pull secrets:  <none>
Mountable secrets:   ebs-csi-controller-sa-token-q55n7
Tokens:              ebs-csi-controller-sa-token-q55n7
Events:              <none>
## agregar a las ec2 del eks los siguientes tag
CSIVolumeName = true
ebs.csi.aws.com/cluster = true
# actualizar pod
kubectl delete pod ebs-csi-node-* -n kube-system
kubectl delete pod ebs-csi-controller-* -n kube-system
######################################################################################
#Herramientas DevOps
######################################################################################
##conectarse a EKS
#bastion devops
aws eks update-kubeconfig --name "eks-devops-R4SM0zGw" --profile default --region eu-west-1
# local
aws eks update-kubeconfig --name "eks-devops-R4SM0zGw" --profile atos-integracam-tf-desarrollo-ireland --region eu-west-1
######################################################################################
# Jenkins
######################################################################################
#Crear Namespace
kubectl create namespace jenkins
#Descargar helmchart
git clone https://github.com/jenkinsci/helm-charts.git
#add repo
helm repo add jenkins https://charts.jenkins.io
#modificar values-itc.yaml
image: "jenkins/jenkins"
tag: 2.368-jdk17
serviceType: LoadBalancer
servicePort: 80
installPlugins:
    - kubernetes:3600.v144b_cd192ca_a_
    - workflow-aggregator:581.v0c46fa_697ffd
    - git:4.11.3
    - configuration-as-code:1512.vb_79d418d5fc8
    #- configuration-as-code:1429.v09b_044a_c93de por error al iniciar contenedor init, problemas dependencias
#install
helm install jenkins --namespace jenkins \
    -f values-itc.yaml \
    jenkins/jenkins;
# LoadBalancer - error al crear LoadBalancer
# error
Error syncing load balancer: failed to ensure load balancer: Multiple tagged security groups found for instance i-0d9cb28d5b9e234a1; ensure only the k8s security group is tagged; the tagged groups were sg-026d583217898af88(eks-devops-R4SM0zGw-node-20221009054643232900000003) sg-0f4d6b44c31ff398b(eks-cluster-sg-eks-devops-R4SM0zGw-884306662)
# Causa
Tiene muchos Security Group con el tag : kubernetes.io/cluster/eks-devops-R4SM0zGw = owned
por eso no sabe donde crear el LoadBalancer
# Solucion
Solo debe haber tag en el SG:
sg-0f4d6b44c31ff398b - eks-cluster-sg-eks-devops-R4SM0zGw-884306662
# get pass of admin jenkins
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
pass: igD7EdhYBKhB690q33YmVO
# URL
http://jenkins.atos-integracam.int
http://ac99035cb2147412295389512fde1ce7-867936224.eu-west-1.elb.amazonaws.com
#Uninstall
helm delete jenkins --namespace jenkins


Fuente:
https://www.eksworkshop.com/beginner/170_statefulset/ebs_csi_driver/
# Creación del rol de IAM del controlador CSI de Amazon EBS para cuentas de servicio
https://docs.aws.amazon.com/eks/latest/userguide/csi-iam-role.html
# VPC yotube
https://www.youtube.com/watch?v=35zd1FAMrjA

######################################################################################
# artifactory-jcr
######################################################################################
# Crear Namespace
kubectl create namespace artifactory-jcr

#clonar helmchart
#solo descargar
#Helmchart
#wget https://charts.jfrog.io/artifactory-jcr-3.18.12.tgz
#tar zxvf artifactory-jcr-3.18.12.tgz
#values /artifactory-jcr/charts/artifactory/values.yaml
#crear artifactory-jcr/charts/artifactory/values-itc.yaml

helm repo add jfrog https://charts.jfrog.io
helm repo update
# agregar al SG de postgresql para EKS node group acceda al 6432
# sg eks-devops-eks-node-group-20221009054653696500000009
#install
helm upgrade --install jfrog-container-registry \
    --namespace artifactory-jcr jfrog/artifactory-jcr \
    -f values-itc.yaml
#Uninstall
helm delete jfrog-container-registry --namespace artifactory-jcr  

# Acceso
user: admin
pass: Admin2022.
http://artifactory-jcr.atos-integracam.int/
http://a1d28322cb41842dda29f12aa984e8b3-1977519743.eu-west-1.elb.amazonaws.com/

######################################################################################
# artifactory-jcr
######################################################################################
# Crear Namespace
kubectl create namespace artifactory-oss
#clonar helmchart
#solo descargar
#Helmchart
#wget https://charts.jfrog.io/artifactory-oss-3.18.12.tgz
#tar zxvf artifactory-oss-3.18.12.tgz
#values artifactory-oss/charts/artifactory/values.yaml
#crear artifactory-oss/charts/artifactory/values-itc.yaml
helm repo add jfrog https://charts.jfrog.io
helm repo update
#install
helm upgrade --install artifactory-oss \
    --namespace artifactory-oss jfrog/artifactory-oss \
    -f values-itc.yaml
#Uninstall
helm delete artifactory-oss --namespace artifactory-oss 
# Acceso
user: admin
pass: Admin2022.
http://artifactory-oss.atos-integracam.int/
http://a573ae2ad6639479580931a3638a98b9-1524986436.eu-west-1.elb.amazonaws.com/
######################################################################################
# sonarqube
######################################################################################
# Crear Namespace
kubectl create namespace sonarqube
#clonar helmchart
#solo descargar
#Helmchart
git clone https://github.com/SonarSource/helm-chart-sonarqube.git
#Helmchart
#https://github.com/SonarSource/helm-chart-sonarqube/tree/master/charts/sonarqube
#values
#https://github.com/SonarSource/helm-chart-sonarqube/blob/master/charts/sonarqube/values.yaml
#crear helm-chart-sonarqube/charts/sonarqube/values-itc.yaml
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
#install
helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube -f values-itc.yaml
#Uninstall
helm uninstall sonarqube -n sonarqube
# Acceso
user: admin
pass: Admin2022.
http://sonarqube.atos-integracam.int/
http://adaa72dfabec942828363b6042237ff4-2047265591.eu-west-1.elb.amazonaws.com/



######################################################################################
# SonarQube pod no inicia porque PVC esta en otra zona
######################################################################################
# Fuente solucion
# https://stackoverflow.com/questions/51946393/kubernetes-pod-warning-1-nodes-had-volume-node-affinity-conflict
# verificar el valor del label de los nodos EKS 
kubectl describe node ip-10-36-9-12.eu-west-1.compute.internal
failure-domain.beta.kubernetes.io/zone=eu-west-1a
topology.kubernetes.io/zone=eu-west-1a
# verificar el label del PVC
# kubectl describe pv pvc-d1908001-7e50-4ef8-9fd1-5ee581df69cc -n sonarqube
Labels:            topology.kubernetes.io/region=eu-west-1
                   topology.kubernetes.io/zone=eu-west-1b
# Cambiar el storage class para solo programe en la zona disponible de los nodos
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: gp2
  ...
allowedTopologies:
- matchLabelExpressions:
  - key: failure-domain.beta.kubernetes.io/zone
    values:
    - eu-west-1a
# aplicar cambios kubectl apply -f  storageclasses.yaml
# desinstalar sonarqube
# eliminar la bd con usuarios conectados
# verificar SELECT * FROM pg_stat_activity WHERE pg_stat_activity.datname='sonarqube';
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'sonarqube';
DROP DATABASE sonarqube;
create database sonarqube
    with owner devops;
# instalar
# ahora el pv se va crear en la zona disponible del nodo

