/*
   Variables for virtual network module
*/

/**********************************************
Provider details
**********************************************/
variable "subscription_id" {
  type        = string
  default     = "0aXXXXXXXXXXXXXXXXXb5e"
  description = "azure subscription id"
}
variable "tenant_id" {
  type        = string
  default     = "d6XXXXXXXXXXXXXXXXX2b"
  description = "azure tenant id "
}
variable "client_id" {
  type        = string
  default     = "c3f3XXXXXXXXXXXXXXXXX85a"
  description = "azure client id"
}
variable "client_secret" {
  type        = string
  default     = "785XXXXXXXXXXXXXXXXX3f02"
  description = "azure client secret id"
}

/************************************************
Global Variables
*************************************************/
variable "resourceGroup" {
  type        = string
  description = "Project Resource group:"
  default     = "azResourceGroup"
}
variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name:"
  default     = "vnet"
}
#variable "wafip" {
#  type = string
#  description = "Public IP for security:"
#  default     = "wafip"
#}
variable "location" {
  type        = string
  description = "Location:"
  default     = "westeurope"
}

/************************************************
Global Tags
*************************************************/
#variable "environment_owner" {
#  type = string
#  description = "Environment-owner Name:"
#  default     = "ccoe"
#}
#variable "environment_costcenter" {
#  type = string
#  description = "Environment-costcenter Name:"
#  default     = "ccoe"
#}
#variable "environment_controller" {
#  type = string
#  description = "Environment-controller Name:"
#  default     = "ccoe"
#}

/************************************************
Application Gateway Configuration
*************************************************/

variable "waf_sku_name" {
  type        = string
  description = "Application Gateway SKU:"
  default     = "WAF_v2"
}
variable "waf_sku_tier" {
  type        = string
  description = "Application Gateway Tier:"
  default     = "WAF_v2"
}
variable "waf_sku_capacity" {
  type        = string
  description = "Application Gateway Capacity:"
  default     = "1"
}
variable "waf_firewall_mode" {
  type        = string
  description = "Application Gateway WAF firewall mode:"
  default     = "Detection"
}
variable "waf_configuration_enabled" {
  type        = string
  description = "Application Gateway WAF configuration enable: true/false"
  default     = true
}
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/slovink/terraform-azure-applicationgateway"
  description = "Terraform current module repo"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "contact@slovink.com"
  description = "ManagedBy, eg 'slovink'."
}

#variable "enable" {
#  type        = bool
#  default     = true
#  description = "Flag to control the module creation"
#}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of an existing resource group to be imported."
}

variable "subnet_id" {
  type = string
}
#variable "public_ip_address_id" {
#  type    = string
#  default = ""
#}
