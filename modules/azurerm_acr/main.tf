resource "azurerm_container_registry" "acr" {
  for_each = var.acrs

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  quarantine_policy_enabled     = each.value.quarantine_policy_enabled
  retention_policy_in_days      = each.value.retention_policy_in_days
  trust_policy_enabled          = each.value.trust_policy_enabled
  zone_redundancy_enabled       = each.value.zone_redundancy_enabled
  export_policy_enabled         = each.value.export_policy_enabled
  anonymous_pull_enabled        = each.value.anonymous_pull_enabled
  data_endpoint_enabled         = each.value.data_endpoint_enabled
  network_rule_bypass_option    = each.value.network_rule_bypass_option

  tags = each.value.tags

  # ----optional block----
  
  dynamic "identity" {
    for_each = each.value.identity == null ? [] : each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}