################
#### aks
variable "rg_name" {
  description = "Name Resource Group on Azure"
  type        = string
}

variable "location" {
  description = "Location Project on Azure"
  type        = string
}

variable "prefix" {
  description = "Prefix resources"
  type        = string
}


variable "cluster_name" {
  description = "AKS name in Azure"
  type        = string
}

variable "kubernetes_version" {
  type        = string
  description = "AKS version"
}

variable "system_node_count" {
  type        = number
  description = "Quantity of nodes in AKS"

}
variable "azure_acr_name" {
  type        = string
  description = "Name of Azure Container Registry"
}
variable "azure_acr_role_name" {
  type        = string
  description = "Name of policy of azure Container Registry"
}

variable "vmsize_node" {
  type        = string
  description = "Size of nodes in cluster"
}