# Create an application gateway
resource "azurerm_application_gateway" "appgw" {
  name                       = "${var.resourceGroup}-applicationgw"
  resource_group_name        = var.resourceGroup
  location                   = var.location
  depends_on                 = [data.azurerm_subnet.wafsubnet]

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
    subnet_id = data.azurerm_subnet.wafsubnet.id
  }

  frontend_port {
    name = "waf-feport"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "waf-feip"
    public_ip_address_id = data.azurerm_public_ip.wafip.id
    
  }
backend_address_pool {
    name            = "waf-beappool1"
   
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
     
  tags = local.resourceTags

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


