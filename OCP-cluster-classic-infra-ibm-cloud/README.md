# OCP Cluster Classic Infra on IBM Cloud

This document explains how to create an Openshift Cluster of Classic Infra type on IBM Cloud using terraform.

1. Fetch the latest provider info for ibm-cloud and update the `main.tf` file provider section. Refer - https://registry.terraform.io/providers/IBM-Cloud/ibm/latest for latest version and info for the provider.
2. Update the `terraform.tfvars` file with appropriate variables. Refer - https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/container_cluster
3. Run `terraform init` to initiate the provider.
4. Run `terraform plan` to retrieve the plan info and check the list of resources that will get created. In this case, it will create a resource group and OCP cluster (Classic Infra)
5. Run `terraform apply` which will initiate the resources creation.
