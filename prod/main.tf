module "resource" {
  source = "../Modules/azurerm_resource_group"
  RGS    = var.RGS
}

module "pip" {
  source     = "../Modules/azurerm_public_ip"
  PUBLIC_IPS = var.PUBLIC_IPS
  depends_on = [module.resource]
}

module "vnet" {
  source     = "../Modules/azurerm_virtual_network"
  VNETS      = var.VNETS
  depends_on = [module.resource]

}

module "subnet" {
  source     = "../Modules/azurerm_subnet"
  SUBNETS    = var.SUBNETS
  depends_on = [module.vnet]

}




module "vms" {
  source = "../Modules/azurerm_virtual_machine"

  VMS = var.VMS
  depends_on = [
    module.subnet,
    module.pip,
    module.resource,
    module.vnet
  ]
}

module "key_vaults" {
  source     = "../Modules/azurerm_key_vault"
  depends_on = [module.resource]
  key_vaults = var.key_vaults
}

module "sqlserver" {
  source      = "../Modules/azurerm_sqlserver"
  SQL_SERVERS = var.SQL_SERVERS
  depends_on  = [module.resource]
}

module "database" {
  source        = "../Modules/azurerm_Database"
  SQL_DATABASES = var.SQL_DATABASES

  depends_on = [module.resource, module.sqlserver]
}

module "storage_accounts" {
  source           = "../Modules/azurerm_storage"
  storage_accounts = var.storage_accounts
  depends_on       = [module.resource]
}