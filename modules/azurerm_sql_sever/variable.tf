variable "servers" {
  description = "Map of SQL servers to create"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = optional(map(string))
    minimum_tls_version          = optional(string)

    # azure_ad_administrator = optional(list(object({
    #   login_username              = string
    #   object_id                   = string
    #   tenant_id                   = optional(string)
    #   azuread_authentication_only = optional(bool, false)
    # })))

    # identity = optional(object({
    #   type         = string
    #   identity_ids = optional(list(string))
    # }))
  }))
}
