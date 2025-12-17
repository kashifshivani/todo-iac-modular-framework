data "azurerm_key_vault" "kvv" {
  for_each = var.kvsecs
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_key_vault_secret" "kvsecret" {
  for_each = var.kvsecs
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kvv[each.key].id
}