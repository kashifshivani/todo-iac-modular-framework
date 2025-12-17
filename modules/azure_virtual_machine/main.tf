

resource "azurerm_network_interface" "nic" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
    name                          = ip_configuration.value.name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    } 
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  # admin credentials: prefer explicit values in var.vms, otherwise fallback to Key Vault secrets
  admin_username      = data.azurerm_key_vault_secret.kv_secret_username[each.key].name
  admin_password      = data.azurerm_key_vault_secret.kv_secret_password[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  dynamic  "os_disk" {
    for_each = each.value.os_disk
    content {
    caching              = os_disk.value.caching
    storage_account_type =  os_disk.value.storage_account_type
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
    publisher = source_image_reference.value.publisher
    offer     = source_image_reference.value.offer
    sku       = source_image_reference.value.sku
    version   = source_image_reference.value.version
    }
  }
}
  

