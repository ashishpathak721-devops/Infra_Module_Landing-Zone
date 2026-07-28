resource "azurerm_linux_virtual_machine" "linux" {
    for_each = var.vm
  name                = each.value.name
  resource_group_name = each.value.res
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_id
  admin_password =      each.value.password
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.nic[each.value.nicid].id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}