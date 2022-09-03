ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

#Crear Namespace
kubectl create namespace artifactory-oss

#clonar helmchart
#solo descargar

#Helmchart
#wget https://charts.jfrog.io/artifactory-oss-3.18.12.tgz
#tar zxvf artifactory-oss-3.18.12.tgz
#values artifactory-oss-3.18.12.tgz
#/artifactory-jcr/values.yaml

helm repo add jfrog https://charts.jfrog.io
helm repo update
#install
helm upgrade --install artifactory-oss \
    --namespace artifactory-oss jfrog/artifactory-oss \
    -f values-itc.yaml





#Postinstalacion


#Uninstall
helm delete artifactory-oss --namespace artifactory-oss 

#Autenticacion
user:
admin
pass:
admin2022.

NODE_PORT:
30001
NODE_IP: 
10.36.9.8

http://10.36.9.8:30001/