

data "azurerm_subnet" "subnets" {
  for_each             = var.VMS
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.VMS
  name                = each.value.pip_name
  resource_group_name =  each.value.rg_name
}

data "azurerm_key_vault" "key_vaults" {
  for_each = var.VMS
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each     = var.VMS
  name         = "vm-username-1-new"
  key_vault_id = data.azurerm_key_vault.key_vaults[each.key].id
}

data "azurerm_key_vault_secret" "vm_password" {
  for_each     = var.VMS
  name         = "vm-password-1-new"
  key_vault_id = data.azurerm_key_vault.key_vaults[each.key].id
}