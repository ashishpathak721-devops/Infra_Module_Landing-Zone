resource "azurerm_subnet" "ashish_subnet" {
    for_each = var.subnet
    name = each.value.name
    resource_group_name = each.value.res
    virtual_network_name = each.value.vnet
    address_prefixes = each.value.add
}