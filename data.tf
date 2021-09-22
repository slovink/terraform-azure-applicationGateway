data "azurerm_public_ip" "wafip" {
 name                         = var.wafip
 resource_group_name          = var.resourceGroup
}

data "azurerm_subnet" "wafsubnet" {
  name                     = "ApplicationGatewaySubnet"
  resource_group_name      = var.resourceGroup
  virtual_network_name     = var.vnetName
}
