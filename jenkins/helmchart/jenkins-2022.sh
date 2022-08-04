ssh -i "atos-integracam-kp-dev-bastion.pem" ec2-user@ec2-52-204-53-68.compute-1.amazonaws.com

ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104

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

#Postinstalacion
1. Get your 'admin' user password by running:
  kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  export NODE_PORT=$(kubectl get --namespace jenkins -o jsonpath="{.spec.ports[0].nodePort}" services jenkins)
  export NODE_IP=$(kubectl get nodes --namespace jenkins -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/login

3. Login with the password from step 1 and the username: admin
4. Configure security realm and authorization strategy
5. Use Jenkins Configuration as Code by specifying configScripts in your values.yaml file, see documentation: http:///configuration-as-code and examples: https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos

For more information on running Jenkins on Kubernetes, visit:
https://cloud.google.com/solutions/jenkins-on-container-engine

For more information about Jenkins Configuration as Code, visit:
https://jenkins.io/projects/jcasc/


NOTE: Consider using a custom image with pre-installed plugins
#################################################################################
######   WARNING: Persistence is disabled!!! You will lose your data when   #####
######            the Jenkins pod is terminated.                            #####
#################################################################################


#Actualizar
helm upgrade jenkins --namespace jenkins \
    -f values-itc.yaml \
    jenkins/jenkins;

#Uninstall
helm uninstall jenkins

#Autenticacion
user:
admin
pass:
KZ26ibtQCVj7nnsQcoHyT2

NODE_PORT:
31475
NODE_IP: 
10.36.9.8

http://10.36.9.8:31475/login