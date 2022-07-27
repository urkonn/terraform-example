# terraform-example

This example project creates an ECS cluster on AWS using Terraform

Steps for executing it:

- Install terraform on your computer
- Set up you AWS credentials
- Initialize the project executing on the main directory: `terraform init`
- Look the resources to be created with `terrafom plan`
- If everything looks good create the resources `terraform apply`


This example project will create:

- A VPC with two subnets
- An ECS cluster with its service and task definition
- An Application Load Balancer to expose the service to the world
- Policies and security groups

Note:
I haven't tested yet so probably there are some issues

What's missing:

- Routing tables
- A real world application service
- A database for persisting our app data
- ...