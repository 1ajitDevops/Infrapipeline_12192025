variable "VMS" {
  type = map(object({
    vm_name  = string
    nic_name = string
    rg_name  = string
    location = string
    size     = string
    # admin_username = string
    # admin_password = string
    subnet_name = string
    vnet_name   = string
    pip_name    = string
    kv_name     = string
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
