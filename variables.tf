/*
   Variables for virtual network module
*/

/**********************************************
Provider details
**********************************************/
variable "subscription_id" {
  description = "subscription id:"
}
variable "tenant_id" {
  description = "tenant id:"
}
variable "client_id" {
  description = "client id:"
}
variable "client_secret" {
  description = "client secret password:"
}

/************************************************
Global Variables
*************************************************/
variable "resourceGroup" {
  description = "Project Resource group:"
  default = "azResourceGroup"
}
variable "vnetName" {
  description = "Virtual Network Name:"
  default = "mainVnet"
}
variable "wafip" {
  description = "Public IP for security:"
  default = "wafip"
}
variable "location" {
  description = "Location:"
  default     = "westeurope"
}

/************************************************
Global Tags
*************************************************/
variable "environment_owner" {
  description = "Environment-owner Name:"
  default     = "ccoe"
}
variable "environment_costcenter" {
  description = "Environment-costcenter Name:"
  default     = "ccoe"
}
variable "environment_controller" {
  description = "Environment-controller Name:"
  default     = "ccoe"
}

/************************************************
Application Gateway Configuration
*************************************************/

variable "waf_sku_name" {
  description = "Application Gateway SKU:"
  default     = "WAF_v2"
}
variable "waf_sku_tier" {
  description = "Application Gateway Tier:"
  default     = "WAF_v2"
}
variable "waf_sku_capacity" {
  description = "Application Gateway Capacity:"
  default     = "1"
}
variable "waf_firewall_mode" {
  description = "Application Gateway WAF firewall mode:"
  default     = "Detection"
}
variable "waf_configuration_enabled" {
  description = "Application Gateway WAF configuration enable: true/false"
  default     = true
}