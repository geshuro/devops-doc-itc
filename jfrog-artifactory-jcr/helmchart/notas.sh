ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

#Crear Namespace
kubectl create namespace artifactory-jcr

#clonar helmchart
#solo descargar

#Helmchart
#wget https://charts.jfrog.io/artifactory-jcr-3.18.12.tgz
#tar zxvf artifactory-jcr-3.18.12.tgz
#values /artifactory-jcr/charts/artifactory/values.yaml
#crear /artifactory-jcr/charts/artifactory/values-itc.yaml

helm repo add jfrog https://charts.jfrog.io
helm repo update
#install
helm upgrade --install jfrog-container-registry \
    --namespace artifactory-jcr jfrog/artifactory-jcr \
    -f values-itc.yaml





#Postinstalacion


#Uninstall
helm delete jfrog-container-registry --namespace artifactory-jcr  

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