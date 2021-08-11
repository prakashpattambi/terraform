provider "azurerm" {
  subscription_id      = var.subscription_id
  client_id            = var.client_id
  client_secret        = var.client_secret
  tenant_id            = var.tenant_id
  features {}
}

variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}
variable "azurerm_resource_group" {
  description ="enter the resource group name "
}
variable "azurerm_subnet" {
  description ="enter the Subnet name "
}
variable "azurerm_network_interface" {
  description ="enter the NIC "
}
variable "azurerm_virtual_machine" {
  description = "Enter the VM name "
}
variable "location" {
  description = "Enter the location"
}
variable "size" {
  description = "Enter the VM size"
}
variable "sku" {
  description = "Enter the sku"   
}
variable "azurerm_availability_set" {
  description = "Enter the azurerm_availability_set"
}
