variable "vms" {
  type = map(object({

     # data block variable
    subnet_name         = string
    vnet_name           = string
    pip_name            = string
    key_vault_name      = string
    secret_name         = string
    secret_value        = string

    # resource block variable
    nic_name            = string
    location            = string
    resource_group_name = string
    
    

    ip_configuration = map(object({
      name                 = string
      private_ip_address_allocation = string
    }))

    vm_name             = string
    vm_size             = string 
    admin_username      = string
    admin_password      = string 

    os_disk = optional(map(object({
      caching              = string
      storage_account_type = string
    })))

    source_image_reference = optional(map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })))
  }))
}
