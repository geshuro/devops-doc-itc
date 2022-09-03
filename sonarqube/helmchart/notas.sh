ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

#Crear Namespace
kubectl create namespace sonarqube

#clonar helmchart
git clone https://github.com/SonarSource/helm-chart-sonarqube.git

#Helmchart
#https://github.com/SonarSource/helm-chart-sonarqube/tree/master/charts/sonarqube
#values
#https://github.com/SonarSource/helm-chart-sonarqube/blob/master/charts/sonarqube/values.yaml

helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
#install
helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube -f values-itc.yaml





#Postinstalacion
Release "sonarqube" does not exist. Installing it now.
NAME: sonarqube
LAST DEPLOYED: Wed Aug 10 01:31:08 2022
NAMESPACE: sonarqube
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace sonarqube -o jsonpath="{.spec.ports[0].nodePort}" services sonarqube-sonarqube)
  export NODE_IP=$(kubectl get nodes --namespace sonarqube -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT


#Uninstall
helm uninstall sonarqube -n sonarqube

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