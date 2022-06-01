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

variable "vnet_name" {
  description = "Name of Vnet"
  type        = string
}

variable "subnet_name" {
  description = "Name of Subnet"
  type        = string
}