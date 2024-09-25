terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71, < 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.14"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  use_cli         = true
}

provider "azapi" {
  use_msi = false
}


## Section to provide a random Azure region for the resource group
# This allows us to randomize the region for the resource group.
module "regions" {
  source  = "Azure/regions/azurerm"
  version = "~> 0.3"
}

# This allows us to randomize the region for the resource group.
resource "random_integer" "region_index" {
  max = length(module.regions.regions) - 1
  min = 0
}
## End of section to provide a random Azure region for the resource group

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.3"
}

locals {
  resource_providers_to_register = {
    dev_center = {
      resource_provider = "Microsoft.DevCenter"
    }
  }
}

data "azurerm_client_config" "this" {}

resource "azapi_resource_action" "resource_provider_registration" {
  resource_id = "/subscriptions/${data.azurerm_client_config.this.subscription_id}"
  type        = "Microsoft.Resources/subscriptions@2021-04-01"
  action      = "providers/${local.resource_providers_to_register.dev_center.resource_provider}/register"
  method      = "POST"
}

resource "azurerm_resource_group" "this" {
  location = module.regions.regions[random_integer.region_index.result].name
  name     = module.naming.resource_group.name_unique
}

module "dc" {
  source = "../../"
  # source             = "Azure/avm-res-devcenter-devcenter/azurerm"
  # ...
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  enable_telemetry    = var.enable_telemetry
  dev_center_name     = "devcenter-001"

  depends_on = [azapi_resource_action.resource_provider_registration]
}
