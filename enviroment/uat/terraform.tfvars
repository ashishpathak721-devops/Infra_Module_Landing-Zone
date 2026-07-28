rg = {
  rg1 = { name = "ashish-rg", location = "japaneast" }
  rg2 = { name = "ash-rg", location = "japaneast" }
    rg3 = { name = "ashish-rg1", location = "japaneast" }

}
vnet = {
  vnet1 = { name = "ashish-vnet", location = "japaneast", res = "ashish-rg", address_space = ["10.10.0.0/16"] }
}
subnet = {
  S1 = { name = "frontend-subnet", vnet = "ashish-vnet", res = "ashish-rg", add = ["10.10.1.0/24"] }
  S2 = { name = "backend-subnet", vnet = "ashish-vnet", res = "ashish-rg", add = ["10.10.2.0/24"] }
  S3 = { name = "database-subnet", vnet = "ashish-vnet", res = "ashish-rg", add = ["10.10.3.0/24"] }
  S4 = { name = "AzureBastionSubnet", vnet = "ashish-vnet", res = "ashish-rg", add = ["10.10.4.0/26"] }
}
pip = {
  pip1 = { name = "ashish-pip1", location = "japaneast", res = "ashish-rg", allocation_method = "Static" }
  pip2 = { name = "ashish-pip2", location = "japaneast", res = "ashish-rg", allocation_method = "Static" }
}

Bastion = {
  Bastion1 = { name = "azurebastion", location = "japaneast", res = "ashish-rg", subnetid = "S4", pipid = "pip1" }
}
nic = {
  nic1 = { nic_name = "ashish-nic", nic_location = "japaneast", res = "ashish-rg", subnetid = "S1", pipid = "pip2", vnet_name = "ashish-vnet", }
}
nsg = {
  nsg1 = { name = "ashish-nsg" ,location = "japaneast" ,res = "ashish-rg"}
}

vm = {
  vm1 = { name = "ashish-vm" ,location = "japaneast" ,res= "ashish-rg" , size ="Standard_D2s_v3",admin_id = "ashishadmin" , password = "Test@12345678" ,nicid = "nic1"  }
}