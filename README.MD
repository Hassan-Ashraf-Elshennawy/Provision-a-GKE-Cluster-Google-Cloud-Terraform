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
___________________________________________________________________________________________
## applying all YAML deployment files

kubectl -f apply redis_deployment.yml

kubectl -f apply service.yml

kubectl -f aplly loadbalancer.yml

kubectl -f apply app_deployment.yml
___________________________________________________________________________________________

![Screenshot from 2022-10-31 18-28-23](https://user-images.githubusercontent.com/111524157/199059931-3aafbe66-9c6e-4c9e-a620-7972c4d44e07.png)

![Screenshot from 2022-10-31 18-30-44](https://user-images.githubusercontent.com/111524157/199059971-91f68057-2dda-400a-95bc-c9f633f1d440.png)




