module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rg     = var.rg
}
module "virtual_network" {
  source     = "../../child_modules/azurerm_virtual_network"
  vnet       = var.vnet
  depends_on = [module.resource_group]
}
module "subnet" {
  source     = "../../child_modules/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.virtual_network]
}
module "pip" {
  source     = "../../child_modules/azurerm_publicIp"
  pip        = var.pip
  depends_on = [module.resource_group]
}

module "Bastion" {
  source     = "../../child_modules/azurerm_bastionhost"
  Bastion    = var.Bastion
  pip        = var.pip
  subnet     = var.subnet
  depends_on = [module.pip, module.subnet]
}
module "nic" {
  source     = "../../child_modules/azurerm_network_interface"
  nic        = var.nic
  pip        = var.pip
  subnet     = var.subnet
  depends_on = [module.pip, module.resource_group, module.subnet]
}
module "nsg" {
  source = "../../child_modules/azurerm_network_security_group"
  nsg = var.nsg
  depends_on = [ module.resource_group ]
}
module "vm" {
  source = "../../child_modules/azurerm_virtual_machine"
  vm = var.vm
  nic = var.nic
  depends_on = [ module.nic ]
  
}