#activar vpn
###################################################################
########## Remotear
###################################################################
#conectar a bastion devops
ssh -i "atos-integracam-kp-shared-bastion-devops.pem" ubuntu@shared-bastion-devops.atos-integracam.int


private_dns = [
  "dev-nfs-0.atos-integracam.int",
]
private_ip = [
  "10.36.11.112",
]
server_security_group_id = [
  "sg-0e30a833233044fce",
]

# ejemplo
https://github.com/kubernetes/examples/tree/master/staging/volumes/nfs