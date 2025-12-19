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