variable "storage_accounts" {
    type=map(object({
        storage_name              = string
        rg_name                   = string
        location                  = string
        account_tier              = string
        account_replication_type  = string
    }))
  
}


resource "azurerm_storage_account" "STS" {
    for_each = var.storage_accounts
  name                     = each.value.storage_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}