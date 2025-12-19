variable "PUBLIC_IPS" {
    type = map(object({
      pip_name       = string
      rg_name        = string
      location       = string
      allocation_method = string
      sku            = optional(string)
      tags           = optional(map(string))
    }))
}