# Azure Terraform VM Deployment (NGINX)

This project provisions a fully automated Linux web server on Microsoft Azure using Infrastructure as Code.

The deployment creates a complete network stack and automatically installs and configures NGINX using cloud-init.

The goal of this project is to demonstrate practical cloud engineering skills:

* Infrastructure provisioning with Terraform
* Automated server configuration
* Debugging cloud-init and networking issues
* Reproducible deployments



## Architecture

Terraform provisions:

* Resource Group
* Virtual Network + Subnet
* Network Security Group (SSH + HTTP)
* Public IP
* Network Interface
* Linux Virtual Machine (Ubuntu)

At first boot, cloud-init:

* installs nginx
* deploys a custom website from the repository
* starts the webserver



## Deployment

Login to Azure:

az login


Initialize Terraform:

terraform init


Review deployment plan:

terraform plan


Apply infrastructure:

terraform apply



## Accessing the Server

After deployment Terraform outputs:

terraform output


Open website in browser:

http://<public_ip>


SSH into server:

ssh azureuser@<public_ip>


If the VM was recreated:

ssh-keygen -R <public_ip>



## Troubleshooting

### VM reachable but website not loading

Check nginx:

sudo systemctl status nginx


Check local HTTP:

curl -I http://localhost


### cloud-init debugging

If software is missing after deployment:

sudo cat /var/log/cloud-init-output.log


### Networking issues

Verify open ports:

* SSH: 22
* HTTP: 80


## Project Structure

templates/          cloud-init configuration
website/            deployed webpage
variables.tf        configurable values
outputs.tf          connection helpers
main.tf             infrastructure definition


## Design Decisions

1. Dynamic Security & Least Privilege (SSH Access)
To prevent brute-force attacks and avoid leaving SSH (Port 22) exposed to the public internet, the Network Security Group (NSG) is dynamically secured. Using a Terraform http data source, the inbound rule is strictly limited to the specific public IP address of the machine executing the deployment (/32 CIDR). This ensures secure access without hardcoding IP addresses.

2. Zero-Touch Provisioning (cloud-init)
Instead of manually connecting to the server post-deployment to install dependencies, NGINX and the custom web payload are configured automatically via cloud-init (passed via the custom_data attribute). This enables a fully automated bootstrapping pipeline, ensuring the infrastructure is immutable, reproducible, and ready to serve traffic immediately after the first boot without any manual overhead.


## Concepts Demonstrated

Provisioning vs Configuration:

Terraform provisions infrastructure
cloud-init configures the machine

Infrastructure becomes reproducible and disposable.



## Learning Notes

Common real-world issues encountered during this project:

* SSH host key mismatch after VM recreation
* Azure VM SKU capacity restrictions
* YAML parsing failures in cloud-init
* Network security group misconfiguration


## Future Improvements

* DNS name instead of IP
* HTTPS (Let's Encrypt)
* CI/CD deployment pipeline
* Image baking instead of runtime configuration
