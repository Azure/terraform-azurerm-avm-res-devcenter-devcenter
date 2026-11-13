terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.4"
    }
  }
}
provider "azapi" {
  use_msi = false
}

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/avm-utl-naming/azure"
  version = "0.2.0"
}

locals {
  resource_providers_to_register = {
    dev_center = {
      resource_provider = "Microsoft.DevCenter"
    }
  }
}

data "azapi_client_config" "this" {}

resource "azapi_resource_action" "resource_provider_registration" {
  action      = "providers/${local.resource_providers_to_register.dev_center.resource_provider}/register"
  method      = "POST"
  resource_id = "/subscriptions/${data.azapi_client_config.this.subscription_id}"
  type        = "Microsoft.Resources/subscriptions@2021-04-01"
}
resource "azapi_resource" "this" {
  type = "Microsoft.Resources/resourceGroups@2025-04-01"

  name     = module.naming.resource_group.name_unique
  location = "eastus"
}

moved {
  from = azurerm_resource_group.this
  to   = azapi_resource.this
}

module "dc" {
  source = "../../"

  dev_center_name = "devcenter-001"
  # source             = "Azure/avm-res-devcenter-devcenter/azurerm"
  # ...
  location         = azapi_resource.this.location
  parent_id        = azapi_resource.this.id
  enable_telemetry = var.enable_telemetry
}
