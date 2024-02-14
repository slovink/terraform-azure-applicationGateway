output "application_gateway_id" {
  value = join("", azurerm_application_gateway.appgw[*].id)
}

output "application_gateway_name" {
  value = join("", azurerm_application_gateway.appgw[*].name)
}

output "application_gateway_backend_pool_ids" {
  value = join("", azurerm_application_gateway.appgw.backend_address_pool[*].id)
}

output "application_gateway_frontend_ip_configuration_ids" {
  value = join("", azurerm_application_gateway.appgw.frontend_ip_configuration[*].id)
}

output "application_gateway_frontend_port_ids" {
  value = join("", azurerm_application_gateway.appgw.frontend_port[*].id)
}

output "application_gateway_http_settings_ids" {
  value = join("", azurerm_application_gateway.appgw.backend_http_settings[*].id)
}

output "application_gateway_listener_ids" {
  value = join("", azurerm_application_gateway.appgw.http_listener[*].id)
}

output "application_gateway_rule_ids" {
  value = join("", azurerm_application_gateway.appgw.request_routing_rule[*].id)
}

output "application_gateway_probe_ids" {
  value = join("", azurerm_application_gateway.appgw[*].id)
}

output "application_gateway_sku" {
  value = join("", azurerm_application_gateway.appgw[*].sku[0].name)
}
output "application_gateway_private_ip_address" {
  value = azurerm_application_gateway.appgw.private_endpoint_connection
}
output "application_gateway_frontend_ip_address" {
  value = join("", azurerm_application_gateway.appgw[*].frontend_ip_configuration[0].public_ip_address_id)
}

output "virtual_network_name" {
  value = var.virtual_network_name
}
output "subnet_id" {
  value = var.subnet_id
}
output "domain_name_label" {
  value = azurerm_public_ip.example.domain_name_label
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}
