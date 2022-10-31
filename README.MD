# GCP-final-project
____________________________________________________________________________________________________
## ( Requirements ):

### VPC 2 subnets (management subnet & restricted subnet):

1.Management subnet has the following: • NAT gateway • Private VM

2.Restricted subnet has the following: • Private standard GKE cluster (private control plan) 

3.Restricted subnet must not have access to internet

4.All images deployed on GKE must come from GCR or Artifacts registry.

5.The VM must be private.

6.Deployment must be exposed to public internet with a public HTTP load balancer.

7.All infra is to be created on GCP using terraform.

8.Deployment on GKE can be done by terraform or manually by kubectl tool.

9.The code to be build/dockerized and pushed to GCR is on here:
               https://github.com/atefhares/DevOps-Challenge-Demo-Code
               
10.Don’t use default compute service account while creating the gke cluster, create custom SA and attach it to your nodes.

11. Only the management subnet can connect to the gke cluster.
____________________________________________________________________________________________
## Creating Infrastructure Using Terraform

1-Network: one vpc with two subnets attached to two different ips

2-VM instance on the management subnetwork.

3-Setting up gke in private subnet.

4-A firewall rule attached to the private vm and allow ssh to it using IAP.

5-Nat gateway and a route table.

6-Service accounts that are attached to VM and GKE cluster.
____________________________________________________________________________________________

### terraform init
### terraform apply 
___________________________________________________________________________________________
## Containerizing  application
I have created a one image for  container that connect a  app with redis database, and then push it to GCR.

 docker build -t app:python.
 
docker push gcr.io/"hussin-366113"/app:v1

____________________________________________________________________________________________

## Configuring and installing kubectl inside VM using gcloud
![Screenshot from 2022-10-31 21-22-10](https://user-images.githubusercontent.com/111524157/199092877-55f4f26d-53d0-4da5-bd04-b8cba494ce17.png)

![Screenshot from 2022-10-31 21-23-10](https://user-images.githubusercontent.com/111524157/199092894-50b5a7b7-28b4-4589-8378-4de6ec647574.png)


hassan@private-vm:~$ curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-394.0.0-linux-x86_64.tar.gz

hassan@private-vm:~$ tar -xf google-cloud-cli-394.0.0-linux-x86_64.tar.gz

hassan@private-vm:~$ ./google-cloud-sdk/install.sh

hassan@private-vm:~$ ./google-cloud-sdk/bin/gcloud init

hassan@private-vm:~$ sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

hassan@private-vm:~$ sudo apt-get install kubectl


___________________________________________________________________________________________
## applying all YAML deployment files

kubectl -f apply redis_deployment.yml

kubectl -f apply service.yml

kubectl -f aplly loadbalancer.yml

kubectl -f apply app_deployment.yml
___________________________________________________________________________________________

![app](https://user-images.githubusercontent.com/111524157/199091650-07a3de2f-c41c-475b-b21a-d22933e52be0.jpg)


![Screenshot from 2022-10-31 18-30-44](https://user-images.githubusercontent.com/111524157/199059971-91f68057-2dda-400a-95bc-c9f633f1d440.png)




