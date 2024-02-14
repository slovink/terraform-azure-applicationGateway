# Create an application gateway
module "labels" {
  source      = "git::git@github.com:slovink/terraform-azure-labels.git?ref=1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}


resource "azurerm_application_gateway" "appgw" {
  name                = "${var.resourceGroup}-applicationgw"
  resource_group_name = var.resource_group_name
  location            = var.location

  # WAF configuration
  sku {
    name     = var.waf_sku_name
    tier     = var.waf_sku_tier
    capacity = var.waf_sku_capacity
  }
  waf_configuration {
    firewall_mode    = var.waf_firewall_mode
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
    enabled          = lower(var.waf_configuration_enabled)
  }

  gateway_ip_configuration {
    name      = "waf-ipconfiguration"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "waf-feport"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "waf-feip"
    public_ip_address_id = azurerm_public_ip.example.id
  }
  backend_address_pool {
    name = "waf-beappool1"

  }

  backend_http_settings {
    name                  = "waf-httpsetting1"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "waf-httplstn1"
    frontend_ip_configuration_name = "waf-feip"
    frontend_port_name             = "waf-feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "waf-rule1"
    rule_type                  = "Basic"
    http_listener_name         = "waf-httplstn1"
    backend_address_pool_name  = "waf-beappool1"
    backend_http_settings_name = "waf-httpsetting1"
  }

  tags = module.labels.tags

  lifecycle {
    ignore_changes = [
      backend_address_pool,
      backend_http_settings,
      frontend_port,
      http_listener,
      probe,
      redirect_configuration,
      request_routing_rule,
      ssl_certificate,
      tags,
      url_path_map,
    ]
  }
}



resource "azurerm_public_ip" "example" {
  name                    = "test-pip"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }

}
provider "azurerm" {
  features {
    client_secret   = var.client_secret
    client_id       = var.client_id
    tenant_id       = var.tenant_id
    subscription_id = var.subscription_id
  }
}
