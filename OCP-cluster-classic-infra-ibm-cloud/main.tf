###############################################################################
# Data source
###############################################################################

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.34.0"
    }
  }
  required_version = ">= 0.13"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

###############################################################################
# VARIABLES
###############################################################################

## Common Variables
variable "ibmcloud_api_key" {
  sensitive = true
}
variable "rg_name" {}
variable "cluster_name" {}
variable "zone" {}
variable "worker_count" {
  default = 1
}
variable "worker_flavor" {
  default = "b3c.16x64"
}
variable "hardware_type" {
  default = "shared"
}
variable "kube_version" {
  default = "4.6.44_openshift"
}
variable "public_vlan_id" {}
variable "private_vlan_id" {}

###############################################################################
# CONFIG
###############################################################################

resource "ibm_resource_group" "resourceGroup" {
  name = var.rg_name
}

resource "ibm_container_cluster" "cluster" {
  name              = var.cluster_name
  resource_group_id = ibm_resource_group.resourceGroup.id
  datacenter        = var.zone
  default_pool_size = var.worker_count
  machine_type      = var.worker_flavor
  hardware          = var.hardware_type
  kube_version      = var.kube_version
  public_vlan_id    = var.public_vlan_id
  private_vlan_id   = var.private_vlan_id
}

output "Ingress-subdomain" {
  value = ibm_container_cluster.cluster.ingress_hostname
}
