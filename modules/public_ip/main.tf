resource "azurerm_public_ip" "pip" {
    for_each = var.public_ips
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  

  idle_timeout_in_minutes     = each.value.idle_timeout_in_minutes
  ip_version                  = each.value.ip_version
  sku                         = each.value.sku
  sku_tier                    = each.value.sku_tier
  tags                        = each.value.tags
}

 