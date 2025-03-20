resource "azurerm_resource_group" "rg" {
  name     = "vm-UNIR"
  location = "West Europe"
  tags = {
    environment = "casopractico2"
  }
}

# resource "azurerm_virtual_network" "vn" {
#   name                = "vn-UNIR"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "tls_private_key" "tpk" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "azurerm_subnet" "sn" {
#   name                 = "sn-UNIR"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vn.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_public_ip" "pip" {
#   name                    = "pip-UNIR"
#   location                = azurerm_resource_group.rg.location
#   resource_group_name     = azurerm_resource_group.rg.name
#   allocation_method       = "Static"
#   sku                     = "Standard"
#   idle_timeout_in_minutes = 30

#   tags = {
#     environment = "UNIR"
#   }
# }

# resource "azurerm_network_security_group" "sg" {
#   name                = "acceptanceTestSecurityGroup1"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   security_rule {
#     name                       = "or"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "ssh"
#     priority                   = 110
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   tags = {
#     environment = "Production"
#   }
# }

# resource "azurerm_network_interface" "ni" {
#   name                = "ni-UNIR"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "nic-UNIR"
#     public_ip_address_id          = azurerm_public_ip.pip.id
#     subnet_id                     = azurerm_subnet.sn.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_network_interface_security_group_association" "nsg_a" {
#   network_interface_id      = azurerm_network_interface.ni.id
#   network_security_group_id = azurerm_network_security_group.sg.id
# }

# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = "vm-UNIR"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_D2s_v3"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.ni.id,
#   ]
#   tags = {
#     environment = "casopractico2"
#   }

#   admin_ssh_key {
#     username = "adminuser"
#     #public_key = file("vm.pub")
#     public_key = tls_private_key.tpk.public_key_openssh
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "ubuntu-24_04-lts"
#     sku       = "server"
#     version   = "latest"
#   }
# }

# output "tls_private_key" {
#   value     = tls_private_key.tpk.private_key_pem
#   sensitive = true
# }

# output "public_ip_address" {
#   value = azurerm_public_ip.pip.ip_address
# }