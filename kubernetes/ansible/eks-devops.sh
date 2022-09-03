
####################################################################################
#CONEXION A BASTION DEVOPS
####################################################################################
1.
Encender VPN
2.
Conectarse mediante ssh
ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

####################################################################################
#PASOS CONEXION A EKS
####################################################################################
1. 
Agregar una regla de entrada al Security group del EKS para acceder desde Bastion Devops

2.
Cambiar config, apiVersion: client.authentication.k8s.io/v1alpha1 por apiVersion: client.authentication.k8s.io/v1beta1

3.
Copiar config en donde corresponde
4.
#Actualizar kubeconfig con el mismo perfil de usuario IAM que ha creado el cluster, ya que tiene permisos admin
aws eks update-kubeconfig --name "eks-devops-P1j8A3iw" --profile atos-integracam-tf-desarrollo --region us-east-1

####################################################################################
#CONFIGURAR EKS a nuevos usuarios IAM
####################################################################################
#editar archivo
kubectl edit -n kube-system configmap/aws-auth
#archivo configmap/aws-auth start
apiVersion: v1
data:
  mapAccounts: |
    - "777777777777"
    - "888888888888"
  mapRoles: |
    - "groups":
      - "system:bootstrappers"
      - "system:nodes"
      "rolearn": "arn:aws:iam::841131224287:role/eks-devops-P1j8A3iw20220815051050897700000001"
      "username": "system:node:{{EC2PrivateDNSName}}"
    - "groups":
      - "system:masters"
      "rolearn": "arn:aws:iam::66666666666:role/role1"
      "username": "role1"
  mapUsers: |
    - "groups":
      - "system:masters"
      "userarn": "arn:aws:iam::66666666666:user/user1"
      "username": "user1"
    - "groups":
      - "system:masters"
      "userarn": "arn:aws:iam::66666666666:user/user2"
      "username": "user2"
kind: ConfigMap
metadata:
  creationTimestamp: "2022-08-15T05:11:01Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "1256"
  uid: 291b8fea-ffdf-4f9f-b9df-3e991ffeb51b
#archivo configmap/aws-auth end
#agregar dos usuarios
    - "groups":
      - "system:masters"
      "userarn": "arn:aws:iam::841131224287:user/isaac.mendoza.external@atos.net"
      "username": "isaac"
    - "groups":
      - "system:masters"
      "userarn": "arn:aws:iam::841131224287:user/leyla.ordonez@atos.net"
      "username": "leyla"
#aplicar cambios
#crear clusterrolbinding para los nuevos usuarios
kubectl create clusterrolebinding isaac-cluster-admin-binding --clusterrole=cluster-admin --user=isaac
kubectl create clusterrolebinding leyla-cluster-admin-binding --clusterrole=cluster-admin --user=leyla
#Cambiar kubeconfig a usuario recien agregado
aws eks update-kubeconfig --name "eks-devops-P1j8A3iw" --profile atos-integracam-imendoza-desarrollo --region us-east-1

####################################################################################
#CONFIGURAR EKS con EBS para PVC
####################################################################################
0.
Instalar EKS con terraform 
1.
#Crear secreto con credenciales IAM
Usamos de terraform
kubectl create secret generic aws-secret \
    --namespace kube-system \
    --from-literal "key_id=AKIA4HV2T5TP22TJXSF7" \
    --from-literal "access_key=LIcw7HljEstOpgFeTd+JFJJ878b0KgcO8e+2gocF"

2.
#Instalar controlador EBS

helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update

helm upgrade --install aws-ebs-csi-driver \
    --namespace kube-system \
    aws-ebs-csi-driver/aws-ebs-csi-driver

#Desinstalar
helm delete aws-ebs-csi-driver --namespace kube-system

fuente:
https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/install.md


####################################################################################
#INSTALAR JENKINS
####################################################################################

1.
Instalar Jenkins

#Crear Namespace
kubectl create namespace jenkins

#clonar helmchart
git clone https://github.com/jenkinsci/helm-charts.git

#Helmchart
#https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins
#values
#https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/values.yaml
#https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/VALUES_SUMMARY.md

helm repo add jenkins https://charts.jenkins.io

#install
helm install jenkins --namespace jenkins \
    -f values-itc.yaml \
    jenkins/jenkins;
#desinstalar
helm delete jenkins --namespace jenkins
2.
Acceso a jenkins
URL:
http://a0d65ba060b4d40cf8c225791ee42113-971870118.us-east-1.elb.amazonaws.com:8080/
User:
admin
Clave:
mKj1CSNsiDG6jLiNAlhF6F


####################################################################################
#EKS conexion PostgreSQL EC2
####################################################################################
1. 
Agregar una regla de entrada al Security group del EC2 de PostgreSQL para acceder desde EKS Worker, solo esto no conecta a la BD.
Agregar una regla de entrada al Security group del EC2 de PostgreSQL para el SG del EC2 worker "Acceso EKS DevOps", sino no hay conexion a BD.

####################################################################################
#INSTALAR SONARQUBE, ARTIFACTORY OSS y JCR
####################################################################################
1.
#Crear BD 
create database "sonarqube"
    with owner devops;

create database "artifactory-oss"
    with owner devops;

create database "artifactory-jcr"
    with owner devops;

2.
Accesos
Jenkins:
URL: http://jenkins.integracam.int/
User:
admin
Clave:
Admin2022.

SonarQube
URL:
http://sonarqube.integracam.int/
User:
admin
Clave:
Admin2022.

Artifactory - JCR
URL:
http://artifactory-jcr.integracam.int/
User:
admin
Clave:
Admin2022.

Artifactory - OSS
URL:
http://artifactory-oss.integracam.int/
User:
admin
Clave:
Admin2022.




CONFIGURAR LOAD BALANCER con helmchart
https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

Fuente: https://www.youtube.com/watch?v=ZfjpWOC5eoE

crear service-account.yaml
kubectl apply -f service-account.yaml 
helm repo add eks https://aws.github.io/eks-charts
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
     -n kube-system \
     --set clusterName=eks-devops-P1j8A3iw \
     --set serviceAccount.create=false \
     --set serviceAccount.name=aws-load-balancer-controller \
     --set region=us-east-1 \
     --set vpcId=vpc-0509114957bac2b3f
     #no seteaba automaticamente --set vpcId
kubectl logs -f -n kube-system \
-l app.kubernetes.io/name=aws-load-balancer-controller

helm uninstall aws-load-balancer-controller -n kube-system