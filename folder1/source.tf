
data "azurerm_resource_group" "ibm" {
    name = var.azurerm_resource_group
}
data "azurerm_virtual_network" "ibm" {
    name                = "ibm-WEST-EUROPE"
    resource_group_name = data.azurerm_resource_group.ibm.name
}
data "azurerm_subnet" "ibm" {
    name            = var.azurerm_subnet
    resource_group_name = data.azurerm_resource_group.ibm.name
    virtual_network_name = data.azurerm_virtual_network.ibm.name
}
resource "azurerm_network_interface" "ibm" {
    name           = var.azurerm_network_interface
    location       = data.azurerm_resource_group.ibm.location
    resource_group_name= data.azurerm_resource_group.ibm.name
    ip_configuration {
        name= "privatenic1"
        subnet_id =data.azurerm_subnet.ibm.id
        private_ip_address_allocation = "dynamic"
    }
}
resource "azurerm_availability_set" "ibm" {
  name                = var.azurerm_availability_set
  location            = azurerm_resource_group.ibm.location
  resource_group_name = azurerm_resource_group.ibm.name
}
output "availability_set_id" {
  value = data.azurerm_availability_set.ibm.id
}
# Create virtual machine
resource "azurerm_windows_virtual_machine" "ibm" {
  name = var.azurerm_virtual_machine
  location= var.location
  azurerm_availability_set= azurerm_availability_set.ibm.name
  resource_group_name = data.azurerm_resource_group.ibm.name
 network_interface_ids =[azurerm_network_interface.ibm.id]
  size= var.size
  admin_username ="hweadmin"
  admin_password ="Password!@#$%12345"
 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
 source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.sku
    version   = "laibm"
      }


 }
