
# Defination for resource groups
RGS = {
  RG1 = {
    rg_name    = "prod-rg-11"
    location   = "centralindia"
    managed_by = "team-a"
    tags = {
      environment = "production"
      owner       = "team-a"
    }
  }
  RG2 = {
    rg_name    = "prod-rg-2"
    location   = "centralindia"
    managed_by = "team-b"
    tags = {
      environment = "production"
      owner       = "team-b"
    }
  }
}
##################################################################
# Definition for Public IPs
PUBLIC_IPS = {
  PIP1 = {
    pip_name          = "prod-pip-1"
    rg_name           = "prod-rg-11"
    location          = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
    tags = {
      environment = "production"
      owner       = "team-a"
    }
  }
  PIP2 = {
    pip_name          = "prod-pip-2"
    rg_name           = "prod-rg-2"
    location          = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
    tags = {
      environment = "production"
      owner       = "team-b"
    }
  }
}
##################################################################
# Definition for VNETS variable
VNETS = {
  VNET1 = {
    vnet          = "prod-vnet-1"
    rg_name       = "prod-rg-11"
    location      = "centralindia"
    address_space = ["10.0.0.0/16"]
  }
}
##################################################################
# Definition for SUBNETS variable
SUBNETS = {
  SUBNET1 = {
    subnet_name      = "frontend-subnet"
    rg_name          = "prod-rg-11"
    vnet_name        = "prod-vnet-1"
    address_prefixes = ["10.0.1.0/24"]
  }
  SUBNET2 = {
    subnet_name      = "backend-subnet"
    rg_name          = "prod-rg-11"
    vnet_name        = "prod-vnet-1"
    address_prefixes = ["10.0.2.0/24"]
  }
}

###################################################################
VMS = {
  "VMS1" = {
    pip_name    = "prod-pip-1"
    nic_name    = "prod-nic-1"
    subnet_name = "frontend-subnet"
    vm_name     = "prod-linux-vm-1"
    vnet_name   = "prod-vnet-1"
    rg_name     = "prod-rg-11"
    location    = "centralindia"
    size        = "Standard_B1s"
    
    admin_username     = "azureuser"
    admin_password     = "P@ssw0rd1234!"
    ip_configuration = {
      ipconfig1 = {
        name        = "ipconfig1"
        subnet_name = "frontend-subnet"
        vnet_name   = "prod-vnet-1"
        rg_name     = "prod-rg-11"
        pip_name    = "prod-pip-1"
      }
    }
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    tags = {
      environment = "production"
      owner       = "team-a"
    }
  }
}
####################################################################
# Definition for KEY_VAULTS variable
# key_vaults = {
# KV1 = {
#    kv_name                     = "vm-username-1-new"
#    location                    = "centralindia"
#    rg_name                     = "prod-rg-11"
#    enabled_for_disk_encryption = true
#    soft_delete_retention_days  = 7
#    purge_protection_enabled    = false
#    sku_name                    = "standard"
#    access_policies = [
#     {

#        key_permissions     = ["Get"]
#        secret_permissions  = ["Get", "List", "Set"]
#        storage_permissions = ["Get", "List"]
#    }]
#  }
# }

####################################################################

# Definition for SQL SERVERS variable
SQL_SERVERS = {
  SQLSRV1 = {
    server_name                  = "prod-sql-server-1"
    rg_name                      = "prod-rg-2"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
  }
}
####################################################################
# Definition for SQL DATABASES variable   
SQL_DATABASES = {
  SQLDB1 = {
    database_name = "prod-sql-db-1"
    server_name   = "prod-sql-server-1"
    rg_name       = "prod-rg-2"
    collation     = "SQL_Latin1_General_CP1_CI_AS"
    license_type  = "BasePrice"
    max_size_gb   = 1
    enclave_type  = "Default"
    sku_name      = "Basic"
  }
}
####################################################################
storage_accounts = {
  STS1 = {

    storage_name             = "stsstorageaccount112025"
    rg_name                  = "prod-rg-11"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}
