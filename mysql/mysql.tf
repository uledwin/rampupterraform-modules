
######### Azure Key Vault for password
resource "azurerm_key_vault" "keyvalult" {
  name                       = var.name_keyvault
  resource_group_name        = var.rg_name
  location                   = var.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name                   = "standard"

  enable_rbac_authorization = true

}

resource "azurerm_role_assignment" "role_secret-officer" {
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
  scope                = azurerm_key_vault.keyvalult.id
}

resource "azurerm_key_vault_secret" "keyvaultsecret" {
  name         = var.sql_server_login
  value        = var.sql_server_password
  key_vault_id = azurerm_key_vault.keyvalult.id

  depends_on = [
    azurerm_role_assignment.role_secret-officer
  ]

}


######### MySQL Server
resource "azurerm_mysql_server" "mysql_server" {
  name                = var.sql_server_name
  resource_group_name = var.rg_name
  location            = var.location

  administrator_login          = azurerm_key_vault_secret.keyvaultsecret.name
  administrator_login_password = azurerm_key_vault_secret.keyvaultsecret.value

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}
resource "azurerm_mysql_database" "mysql_database" {
  name                = var.sql_database_name
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

## Allow access to Azure services)
resource "azurerm_mysql_firewall_rule" "firewallmysql" {
  name                = var.fwmysqlconnection
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}