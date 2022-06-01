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

# # variable "connection_string_name" {
# #   description = "Connection String for Webapp"
# #   type        = string
# # }

variable "sql_server_name" {
  description = "Name of Ms SQL Server"
  type        = string
}

variable "sql_server_login" {
  description = "User Login of Ms SQL Server"
  type        = string
  sensitive   = true
}

variable "sql_server_password" {
  description = "Password of MS SQL Server"
  type        = string
  sensitive   = true
}

variable "sql_database_name" {
  description = "Name of sql mssql server"
  type        = string
}

variable "name_keyvault" {
  description = "Name of KeyVault"
  type        = string

}

variable "fwmysqlconnection" {
  description = "Allow access to azure services"
  type        = string
}