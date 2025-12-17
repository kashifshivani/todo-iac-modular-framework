variable "nsgs" {
    type = map(object({
        nsg_name            = string
        location            = string
        resource_group_name = string
        vnet_name           = string
        subnet_name         = string

        tags                       = optional(map(string))

        security_rule = optional(list(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            

            # optional
            source_port_range          = optional(string)
            destination_port_range     = optional(string)
            source_address_prefix      = optional(string)
            destination_address_prefix = optional(string)
        })))
        
    }))
  
}