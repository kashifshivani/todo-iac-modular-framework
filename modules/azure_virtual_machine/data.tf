

data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kv_secret_username"  {
  # only create secret data sources for VMs that declare both kv and secret name
  for_each = var.vms
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "kv_secret_password"  {
  for_each = var.vms
  name         = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}