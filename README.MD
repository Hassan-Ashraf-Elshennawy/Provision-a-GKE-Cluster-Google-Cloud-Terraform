GCP-Final-Project
Requirements :
1 VPC 2 subnets (management subnet & restricted subnet):

Management subnet has the following: • NAT gateway • Private VM
Restricted subnet has the following: • Private standard GKE cluster (private control plan) Notes:
Restricted subnet must not have access to internet
All images deployed on GKE must come from GCR or Artifacts registry.
The VM must be private.
Deployment must be exposed to public internet with a public HTTP load balancer.
All infra is to be created on GCP using terraform.
Deployment on GKE can be done by terraform or manually by kubectl tool.
The code to be build/dockerized and pushed to GCR is on here: https://github.com/atefhares/DevOps-Challenge-Demo-Code
Don’t use default compute service account while creating the gke cluster, create custom SA and attach it to your nodes.
Only the management subnet can connect to the gke cluster.

Creating Infrastructure Using Terraform
1-Network: one vpc with two subnets attached to two different ips

2-VM instance on the management subnetwork.

3-Setting up gke in private subnet.

4-A firewall rule attached to the private vm and allow ssh to it using IAP.

5-Nat gateway and a route table.

6-Service accounts that are attached to VM and GKE cluster.
