####################################################################################
# Conectarse al servidor bastion devops
####################################################################################
ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104
####################################################################################
# KEYCLOAK HELMCHART
####################################################################################
# Descargar repo de keycloack
helm repo add bitnami https://charts.bitnami.com/bitnami
wget https://charts.bitnami.com/bitnami/keycloak-9.7.4.tgz
tar zxvf keycloak-9.7.4.tgz
# Crear archivo custmizar de values.yaml
cd keycloak/
vi values-customizar.yaml
# Crear Namespace openldap
kubectl create namespace keycloak
# Instalar helmchart
helm install keycloak -f values-customizar.yaml bitnami/keycloak --version 9.7.4 -n keycloak 

# resultado
NAME: keycloak
LAST DEPLOYED: Tue Sep  6 11:03:26 2022
NAMESPACE: keycloak
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: keycloak
CHART VERSION: 9.7.4
APP VERSION: 18.0.2

** Please be patient while the chart is being deployed **

Keycloak can be accessed through the following DNS name from within your cluster:

    keycloak.keycloak.svc.cluster.local (port 80)

To access Keycloak from outside the cluster execute the following commands:

1. Get the Keycloak URL by running these commands:

    export HTTP_NODE_PORT=$(kubectl get --namespace keycloak -o jsonpath="{.spec.ports[?(@.name=='http')].nodePort}" services keycloak)
    export NODE_IP=$(kubectl get nodes --namespace keycloak -o jsonpath="{.items[0].status.addresses[0].address}")

    echo "http://${NODE_IP}:${HTTP_NODE_PORT}/"

2. Access Keycloak using the obtained URL.
3. Access the Administration Console using the following credentials:

  echo Username: user
  echo Password: $(kubectl get secret --namespace keycloak keycloak -o jsonpath="{.data.admin-password}" | base64 -d)

# Testing
kubectl logs keycloak-0 -n keycloak -o wide
http://keycloak.atos-integracam.int:30001/
Username: user
pass: Admin2022.





# Desinstalar
helm delete keycloak --namespace keycloak

# Fuente:
https://github.com/bitnami/charts/tree/master/bitnami/keycloak
https://artifacthub.io/packages/helm/bitnami/keycloak/9.7.4


####################################################################################
# Conectarse al servidor EKS
####################################################################################
ssh -i "atos-integracam-eks-devops.pem" ubuntu@10.36.9.48
ssh -i "atos-integracam-eks-devops.pem" root@10.36.9.48


####################################################################################
## Configure Keycloak
####################################################################################
Create Realm: Business

Create User Federation:
Connection URL:
ldap://openldap.openldap.svc.cluster.local
Users DN:
ou=People,dc=integracam,dc=org
Bind DN:
cn=admin,dc=integracam,dc=org
Bind Credential:
Not@SecurePassw0rd

Create LDAP-Mappers/group
LDAP Groups DN:
ou=Group,dc=integracam,dc=org
Group Object Classes:
groupOfUniqueNames
Membership LDAP Attribute:
uniqueMember

Click: Save

Crear la ou
ou=People: Para que sincronice aqui todos los usuarios.
ou=Group: Para que sincronice aqui todos los GRUPOS.

####################################################################################
## Fuentes
####################################################################################
https://medium.com/linkbynet/kubernetes-sso-using-keycloak-aafdb730d192
https://github.com/tperelle/keycloak-federation#deploy-a-secured-application
#paso a paso
https://github.com/tperelle/keycloak-federation/tree/main/lab