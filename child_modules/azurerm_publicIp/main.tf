resource "azurerm_public_ip" "pip" {
    for_each = var.pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.res
  allocation_method   = each.value.allocation_method
}