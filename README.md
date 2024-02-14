# Azure Application Gateway
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/vpn/azurerm/)

Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications. Traditional load balancers operate at the transport layer (OSI layer 4 - TCP and UDP) and route traffic based on source IP address and port, to a destination IP address and port.

## Version compatibility

| Module version | Terraform version |
|----------------|-------------------|
| >= 1.x.x       | 0.14.x            |
| >= 1.x.x       | 0.13.x            |
| >= 1.x.x       | 0.12.x            |

## Resources

* Azure Application Gateway


## Configuration

The follwoing Options are available to configure Azure Application Gateway.

**Application Gateway Configuration**

Below options are available for Application gateway configuration .

```SKU Configuration```

```name``` (Required) The Name of the SKU to use for this Application Gateway. Possible values are ...

* Standard_Small
* Standard_Medium
* Standard_Large
* Standard_v2
* WAF_Medium
* WAF_Large
* WAF_v2

```tier``` (Required) The Tier of the SKU to use for this Application Gateway. Possible values are ...

* Standard
* Standard_v2
* WAF and WAF_v2

```capacity``` (Required) The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set.

```sh
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 1
```

```WAF Configuratuion```

```firewall_mode``` (Required) The Web Application Firewall Mode. Possible values are ...

* Detection
* Prevention.

```rule_set_type``` (Required) The Type of the Rule Set used for this Web Application Firewall. Currently, only OWASP is supported.

```rule_set_version``` (Required) The Version of the Rule Set used for this Web Application Firewall. Possible values are ...

* 2.2.9
* 3.0
* 3.1

```sh
    firewall_mode    = "Detection"
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
    enabled          = true
```

## How to Use

```hcl
module "applicationGateway" {
  source  = ""

  prefix =
  project_prefix =
  project =
  environment =
  location =

  environment_owner =
  environment_costcenter =
  environment_controller =


  }
```


## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/slovink/terraform-azure-applicationGateway/blob/dev/LICENSE) file for details.



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-azure-applicationGateway/issues), or feel free to drop us an email at [devops@slovink.com](mailto:devops@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-azure-applicationGateway)!




## Deploy Resources

**Initialize terraform module**

```sh
terraform init
```
**Plan terraform module**

```sh
terraform plan
```

**Deploy terraform module**

```sh
terraform apply
```

## Destroy Resources

**Destroy terraform module**

```sh
terraform destroy
``

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.87.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::git@github.com:slovink/terraform-azure-labels.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.appgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |
| [azurerm_public_ip.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | azure client id | `string` | `"c3f3XXXXXXXXXXXXXXXXX85a"` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | azure client secret id | `string` | `"785XXXXXXXXXXXXXXXXX3f02"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location: | `string` | `"westeurope"` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink'. | `string` | `"contact@slovink.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/slovink/terraform-azure-applicationgateway"` | no |
| <a name="input_resourceGroup"></a> [resourceGroup](#input\_resourceGroup) | Project Resource group: | `string` | `"azResourceGroup"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group to be imported. | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | azure subscription id | `string` | `"0aXXXXXXXXXXXXXXXXXb5e"` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | azure tenant id | `string` | `"d6XXXXXXXXXXXXXXXXX2b"` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Virtual Network Name: | `string` | `"vnet"` | no |
| <a name="input_waf_configuration_enabled"></a> [waf\_configuration\_enabled](#input\_waf\_configuration\_enabled) | Application Gateway WAF configuration enable: true/false | `string` | `true` | no |
| <a name="input_waf_firewall_mode"></a> [waf\_firewall\_mode](#input\_waf\_firewall\_mode) | Application Gateway WAF firewall mode: | `string` | `"Detection"` | no |
| <a name="input_waf_sku_capacity"></a> [waf\_sku\_capacity](#input\_waf\_sku\_capacity) | Application Gateway Capacity: | `string` | `"1"` | no |
| <a name="input_waf_sku_name"></a> [waf\_sku\_name](#input\_waf\_sku\_name) | Application Gateway SKU: | `string` | `"WAF_v2"` | no |
| <a name="input_waf_sku_tier"></a> [waf\_sku\_tier](#input\_waf\_sku\_tier) | Application Gateway Tier: | `string` | `"WAF_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_gateway_backend_pool_ids"></a> [application\_gateway\_backend\_pool\_ids](#output\_application\_gateway\_backend\_pool\_ids) | n/a |
| <a name="output_application_gateway_frontend_ip_address"></a> [application\_gateway\_frontend\_ip\_address](#output\_application\_gateway\_frontend\_ip\_address) | n/a |
| <a name="output_application_gateway_frontend_ip_configuration_ids"></a> [application\_gateway\_frontend\_ip\_configuration\_ids](#output\_application\_gateway\_frontend\_ip\_configuration\_ids) | n/a |
| <a name="output_application_gateway_frontend_port_ids"></a> [application\_gateway\_frontend\_port\_ids](#output\_application\_gateway\_frontend\_port\_ids) | n/a |
| <a name="output_application_gateway_http_settings_ids"></a> [application\_gateway\_http\_settings\_ids](#output\_application\_gateway\_http\_settings\_ids) | n/a |
| <a name="output_application_gateway_id"></a> [application\_gateway\_id](#output\_application\_gateway\_id) | n/a |
| <a name="output_application_gateway_listener_ids"></a> [application\_gateway\_listener\_ids](#output\_application\_gateway\_listener\_ids) | n/a |
| <a name="output_application_gateway_name"></a> [application\_gateway\_name](#output\_application\_gateway\_name) | n/a |
| <a name="output_application_gateway_private_ip_address"></a> [application\_gateway\_private\_ip\_address](#output\_application\_gateway\_private\_ip\_address) | n/a |
| <a name="output_application_gateway_probe_ids"></a> [application\_gateway\_probe\_ids](#output\_application\_gateway\_probe\_ids) | n/a |
| <a name="output_application_gateway_rule_ids"></a> [application\_gateway\_rule\_ids](#output\_application\_gateway\_rule\_ids) | n/a |
| <a name="output_application_gateway_sku"></a> [application\_gateway\_sku](#output\_application\_gateway\_sku) | n/a |
| <a name="output_domain_name_label"></a> [domain\_name\_label](#output\_domain\_name\_label) | n/a |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | n/a |
<!-- END_TF_DOCS -->