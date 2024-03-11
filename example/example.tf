provider "azurerm" {
  features {}
}


module "resource_group" {
  source = "git::git@github.com:slovink/terraform-azure-resource-group.git?ref=1.0.0"

  name        = "app-vm"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

module "vnet" {
  source = "git::git@github.com:slovink/terraform-azure-vnet.git?ref=1.0.0"

  name                = "app"
  environment         = "test"
  label_order         = ["name", "environment"]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false
}

module "subnet" {
  source = "git::git@github.com:slovink/terraform-azure-subnet.git?ref=1.0.0"

  name                 = "app"
  environment          = "test"
  label_order          = ["name", "environment"]
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.name
  #subnet
  #  default_name_subnet = true
  subnet_names    = ["subnet1", "subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

  # route_table
  enable_route_table = false
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}

module "security_group" {
  source = "git::git@github.com:slovink/terraform-azure-network-security-group.git?ref=1.0.0"
  ## Tags
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]

  ## Security Group
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_ids              = module.subnet.default_subnet_id
  ##Security Group rule for Custom port.
  inbound_rules = [
    {
      name                       = "ssh"
      priority                   = 101
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "0.0.0.0/0"
      source_port_range          = "*"
      destination_address_prefix = "0.0.0.0/0"
      destination_port_range     = "22"
      description                = "ssh allowed port"
  }]

}
module "virtual-machine" {
  source = "git@github.com:slovink/terraform-azure-virtual-machine.git?ref=1.0.0"

  ## Tags
  name        = "app"
  environment = "test"
  label_order = ["environment", "name"]

  ## Common
  is_vm_linux                     = true
  enabled                         = true
  machine_count                   = 1
  resource_group_name             = module.resource_group.resource_group_name
  location                        = module.resource_group.resource_group_location
  disable_password_authentication = true

  ## Network Interface
  subnet_id                     = [module.subnet.default_subnet_id]
  private_ip_address_version    = "IPv4"
  private_ip_address_allocation = "Static"
  primary                       = true
  private_ip_addresses          = ["10.0.1.4"]
  #nsg
  network_interface_sg_enabled = true
  network_security_group_id    = module.security_group.id

  ## Availability Set
  availability_set_enabled     = true
  platform_update_domain_count = 7
  platform_fault_domain_count  = 3

  ## Public IP
  public_ip_enabled = true
  sku               = "Basic"
  allocation_method = "Static"
  ip_version        = "IPv4"

}

module "application_gateway" {
  source                    = "../"
  name                      = "app7at"
  environment               = "test"
  subnet_id                 = module.subnet.default_subnet_id
  client_id                 = "c3XXXXXXXXXXXXXXXXX5a"
  client_secret             = "78XXXXXXXXXXXXXXXXXf02"
  subscription_id           = "0aXXXXXXXXXXXXXXXXX5e"
  tenant_id                 = "d6XXXXXXXXXXXXXXXXX2b"
  resource_group_name       = module.resource_group.resource_group_name
  virtual_network_name      = module.vnet.name
  wafip                     = "wafip"
  location                  = module.resource_group.resource_group_location
  waf_configuration_enabled = true
  waf_firewall_mode         = "Detection"
  waf_sku_capacity          = 1
  waf_sku_tier              = "WAF_v2"
  waf_sku_name              = "WAF_v2"
  environment_owner         = "ccoe"
  environment_controller    = "ccoe"
  environment_costcenter    = "ccoe"

}
