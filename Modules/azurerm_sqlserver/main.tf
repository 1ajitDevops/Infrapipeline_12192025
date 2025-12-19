



resource "azurerm_mssql_server" "sqlserver" {
    for_each = var.SQL_SERVERS
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

