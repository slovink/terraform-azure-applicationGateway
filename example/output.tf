output "application_gateway_id" {
  value = module.application_gateway.application_gateway_id
}

output "application_gateway_name" {
  value = module.application_gateway.application_gateway_name
}

output "application_gateway_backend_pool_ids" {
  value = module.application_gateway.application_gateway_backend_pool_ids
}

output "application_gateway_frontend_ip_configuration_ids" {
  value = module.application_gateway.application_gateway_frontend_ip_configuration_ids
}

output "application_gateway_frontend_port_ids" {
  value = module.application_gateway.application_gateway_frontend_port_ids
}

output "application_gateway_http_settings_ids" {
  value = module.application_gateway.application_gateway_http_settings_ids
}

output "application_gateway_listener_ids" {
  value = module.application_gateway.application_gateway_listener_ids
}

output "application_gateway_rule_ids" {
  value = module.application_gateway.application_gateway_rule_ids
}

output "application_gateway_probe_ids" {
  value = module.application_gateway.application_gateway_probe_ids
}

output "application_gateway_sku" {
  value = module.application_gateway.application_gateway_sku
}

output "application_gateway_private_ip_address" {
  value = module.application_gateway.application_gateway_private_ip_address
}

output "application_gateway_frontend_ip_address" {
  value = module.application_gateway.application_gateway_frontend_ip_address
}
output "virtual_network_name" {
  value = module.vnet.name
}

