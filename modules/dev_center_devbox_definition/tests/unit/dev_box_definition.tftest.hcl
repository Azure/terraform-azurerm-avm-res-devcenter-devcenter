mock_provider "azapi" {}

variables {
  dev_center_dev_box_definition_dev_center_id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test/providers/Microsoft.DevCenter/devCenters/test"
  dev_center_dev_box_definition_image_reference_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test/providers/Microsoft.DevCenter/devCenters/test/galleries/default/images/test"
  dev_center_dev_box_definition_location          = "westeurope"
  dev_center_dev_box_definition_name              = "test-definition"
  dev_center_dev_box_definition_sku_name          = "general_i_8c32gb256ssd_v2"
  enable_telemetry                               = false
}

run "maps_definition_properties" {
  command = apply

  variables {
    dev_center_dev_box_definition_tags = {
      environment = "test"
    }
    dev_center_dev_box_definition_timeouts = {
      create = "45m"
      delete = "40m"
      read   = "10m"
      update = "50m"
    }
  }

  assert {
    condition = (
      azapi_resource.this.parent_id == var.dev_center_dev_box_definition_dev_center_id &&
      azapi_resource.this.location == var.dev_center_dev_box_definition_location &&
      azapi_resource.this.name == var.dev_center_dev_box_definition_name &&
      azapi_resource.this.body.properties.imageReference.id == var.dev_center_dev_box_definition_image_reference_id &&
      azapi_resource.this.body.properties.sku.name == var.dev_center_dev_box_definition_sku_name &&
      azapi_resource.this.tags.environment == "test" &&
      output.resource_id == azapi_resource.this.id
    )
    error_message = "The AzAPI definition must preserve the existing scope, properties, tags, and resource ID output."
  }

  assert {
    condition = (
      azapi_resource.this.timeouts.create == "45m" &&
      azapi_resource.this.timeouts.delete == "40m" &&
      azapi_resource.this.timeouts.read == "10m" &&
      azapi_resource.this.timeouts.update == "50m"
    )
    error_message = "All custom operation timeouts must reach the AzAPI resource."
  }
}

run "omits_optional_timeouts" {
  command = apply

  assert {
    condition     = azapi_resource.this.timeouts == null
    error_message = "Null timeouts must omit the optional timeouts block."
  }
}
