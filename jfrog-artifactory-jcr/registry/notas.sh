####################################################################################
## Configurar docker local con JCR
####################################################################################
1. Activar VPN
2. Modificar el archivo:
/etc/docker/daemon.json 
o en el docker cliente en seccion docker engine
Agregar el JCR:
{
  ...
  "insecure-registries": [
    "artifactory-jcr.integracam.int"
  ]
}
3. Realizar login
docker login artifactory-jcr.integracam.int
user: imendozah
pass: Devops2022.$
Login Succeeded

####################################################################################
## Push imagen a JCR
####################################################################################
1. Activar VPN
2. tag
docker image tag moby/buildkit:buildx-stable-1 artifactory-jcr.integracam.int/devops/buildkit:latest
3. listar imagenes
docker image ls 
4. push
docker image push artifactory-jcr.integracam.int/devops/buildkit:latest
5. verificar en jcr



####################################################################################
## Fuente
####################################################################################
1. Crear repositorio privado en JCR
https://www.youtube.com/watch?v=8uyCtNXEsrY
