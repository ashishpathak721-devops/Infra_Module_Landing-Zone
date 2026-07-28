data "azurerm_public_ip" "pip" {
    for_each = var.pip
  name                = each.value.name
  resource_group_name = each.value.res
}
data "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.name
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.res
}