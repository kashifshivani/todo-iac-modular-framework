variable "key_vaults" {
    description = "A map of Key Vaults to create."
    type = map(object({
        kv_name                        = string
        location                       = string
        resource_group_name            = string
        sku_name                       = string
    

        access_policies = optional(list(object({
        key_permissions       = optional(list(string))
        secret_permissions    = optional(list(string))
        storage_permissions   = optional(list(string))

        })))

        enabled_for_disk_encryption    = optional(bool)
        soft_delete_retention_days     = optional(number)
        purge_protection_enabled       = optional(bool)
        }))
    }