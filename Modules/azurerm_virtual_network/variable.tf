variable "VNETS" {
  type=map(object({
    vnet          = string
    rg_name       = string
    location      = string
    address_space = list(string)
    dns_servers   = optional(list(string))
    tags          = optional(map(string))
  }))
}