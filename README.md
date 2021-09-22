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
  source  = "https://innersource.soprasteria.com/group-cloud-coe/cloudnetes/modules/azure/terraform-azure-applicationgateway.git"
  version = "1.0.0"

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
