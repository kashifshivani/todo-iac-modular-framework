variable "public_ips" {
  type = map(object({
  pip_name            = string
  resource_group_name = string
  location            = string
  allocation_method   = string

  

  idle_timeout_in_minutes     = optional(number)
  ip_version                  = optional(string)
  sku                         = optional(string)
  sku_tier                    = optional(string)
  tags                        = optional(map(string))
  }))

}
