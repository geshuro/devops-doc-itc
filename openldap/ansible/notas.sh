####################################################################################
# Conectarse al servidor bastion devops
####################################################################################
ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104
####################################################################################
# OPEN LDAP HELMCHART
####################################################################################
#helm repo add stable https://charts.helm.sh/stable
#helm search repo -l stable/openldap
# Descargar repo de openldap
git clone https://github.com/jp-gouin/helm-openldap.git
cd helm-openldap
helm install openldap .
helm install --name my-release -f values.yaml stable/openldap
# Crear archivo custmizar de values.yaml
vi values-customizar.yaml
# Crear Namespace openldap
kubectl create namespace openldap
# Instalar helmchart
helm install openldap -f values-customizar.yaml -n openldap .
# Accesos OpenLDAP
NAME: openldap
LAST DEPLOYED: Tue Sep  6 09:01:19 2022
NAMESPACE: openldap
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

OpenLDAP-Stack-HA has been installed. You can access the server from within the k8s cluster using:

  openldap.openldap.svc.cluster.local:389
  
  Or
  
  openldap.openldap.svc.cluster.local:636


You can access the LDAP adminPassword and configPassword using:

  kubectl get secret --namespace openldap openldap -o jsonpath="{.data.LDAP_ADMIN_PASSWORD}" | base64 --decode; echo
  kubectl get secret --namespace openldap openldap -o jsonpath="{.data.LDAP_CONFIG_PASSWORD}" | base64 --decode; echo


You can access the LDAP service, from within the cluster (or with kubectl port-forward) with a command like (replace password and domain):
  ldapsearch -x -H ldap://openldap.openldap.svc.cluster.local:389 -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w $LDAP_ADMIN_PASSWORD

You can access PHPLdapAdmin, using
     - http://phpldapadmin.integracam

You can access Self Service Password, using
     - http://ssl-ldap2.integracam

Test server health using Helm test:
  helm test openldap

Enjoy :)
# Verificar
 kubectl get all -n openldap
# Datos usuario admin
user: Not@SecurePassw0rd
pass: Not@SecurePassw0rd
# test Forward openldap port to use on localhost
kubectl port-forward openldap-0 3890:389 -n openldap
# Search data
ldapsearch -x -H ldap://localhost:3890 -b dc=integracam,dc=org -D "cn=admin,dc=integracam,dc=org" -w Not@SecurePassw0rd
# Check who am I
ldapwhoami -x -H ldap://localhost:3890
# test PHP Admin
kubectl port-forward openldap-phpldapadmin-56b5b85455-7qc8t  8080:80 -n openldap
# crear user por web

#Fuente:
https://artifacthub.io/packages/helm/helm-openldap/openldap
https://github.com/jp-gouin/helm-openldap