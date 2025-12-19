

data "azurerm_mssql_server" "database" {
    for_each = var.SQL_DATABASES
  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}