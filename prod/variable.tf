# Definition for RGS variable
variable "RGS" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
###################################################################
# Definition for PUBLIC_IPS variable

variable "PUBLIC_IPS" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
    sku               = optional(string)
    tags              = optional(map(string))
  }))
}
###################################################################
# Definition for VNETS variable

variable "VNETS" {
  type = map(object({
    vnet          = string
    rg_name       = string
    location      = string
    address_space = list(string)
    dns_servers   = optional(list(string))
    tags          = optional(map(string))
  }))
}

###################################################################
# Definition for SUBNETS variable

variable "SUBNETS" {
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))

}
###################################################################
# Definition for NICS variable

# variable "NICS" {
#   type = map(object({
#     nic_name         = string
#     rg_name          = string
#     location         = string
#     ip_configuration = map(object({
#       subnet_name = string
#       vnet_name   = string
#       rg_name     = string
#       pip_name    = string
#     }))
#   }))
# }
####################################################################
# Definition for LINUX_VMS variable
variable "VMS" {
  type = map(object({
    vm_name  = string
    nic_name = string
    rg_name  = string
    location = string
    size     = string
    kv_name  = string
    # admin_username = string
    # admin_password = string
    subnet_name = string
    vnet_name   = string
    pip_name    = string

    ip_configuration = map(object({
      name        = string
      subnet_name = string
      vnet_name   = string
      rg_name     = string
      pip_name    = string
    }))

    os_disk_caching              = string
    os_disk_storage_account_type = string

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
####################################################################
# Definition for KEY_VAULTS variable
variable "key_vaults" {
  type = map(object({
    kv_name                     = string
    location                    = string
    rg_name                     = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
    access_policies = list(object({
      # tenant_id             = string
      # object_id             = string
      key_permissions     = list(string)
      secret_permissions  = list(string)
      storage_permissions = list(string)
    }))
  }))
}
###################################################
# Definition for database variables

variable "SQL_DATABASES" {
  type = map(object({
    database_name = string
    server_name   = string
    rg_name       = string
    collation     = string
    license_type  = string
    max_size_gb   = number
    sku_name      = string
    enclave_type  = string
  }))

}

variable "SQL_SERVERS" {
  type = map(object({
    server_name                  = string
    rg_name                      = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))

}
####################################################################
# Definition for STORAGE ACCOUNTS variable
variable "storage_accounts" {
  type = map(object({
    storage_name             = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))

}