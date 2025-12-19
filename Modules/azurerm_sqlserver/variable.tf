variable "SQL_SERVERS" {
    type = map(object({
        server_name                 = string
        rg_name                     = string
        location                    = string
        version                     = string
        administrator_login         = string
        administrator_login_password= string
    }))
  
}
