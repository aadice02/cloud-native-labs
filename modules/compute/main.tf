resource "random_password" "vm_password" {
length = 16
special = true
override_special = "_@%"
}

#resource "azurerm_availability_set" "web_availabilty_set" {
#  name                = "web_availabilty_set"
#  location            = var.location
#  resource_group_name = var.resource_group
#}

resource "azurerm_network_interface" "web-net-interface" {
    name = "web-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "web-webserver"
        subnet_id = var.web_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "web-vm" {
  name = "web-vm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.web-net-interface.id ]
#  availability_set_id = azurerm_availability_set.web_availabilty_set.id
  vm_size = "Standard_B2s"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "web-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.web_host_name
    admin_username = var.web_username
#    admin_password = var.web_os_password
    admin_password = random_password.vm_password.result
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
