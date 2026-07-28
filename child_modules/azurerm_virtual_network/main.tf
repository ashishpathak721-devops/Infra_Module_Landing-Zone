resource "azurerm_virtual_network" "ashish_vnet" {
    for_each = var.vnet
    name = each.value.name
    resource_group_name = each.value.res
    location = each.value.location
    address_space = each.value.address_space
}