

# resource "azurerm_bastion_host" "bastion" {
#   for_each            = var.bastion
#   name                = each.value.bastion_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   dynamic  "ip_configuration" {
#     for_each = [each.value.ip_configuration]
#     content {
#     name                 = lookup(each.value,"ip_configuration_name","configuration")
#     subnet_id = data.azurerm_subnet.subnet[each.value.subnetid].id

#     public_ip_address_id = data.azurerm_public_ip.pip[each.value.pipid].id

#   }
# }
# }