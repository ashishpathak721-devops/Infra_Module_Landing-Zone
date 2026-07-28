resource "azurerm_network_interface" "nic" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.res

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.value.subnetid].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id =  data.azurerm_public_ip.pip[each.value.pipid].id
  }
}