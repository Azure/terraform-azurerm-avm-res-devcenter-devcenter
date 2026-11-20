mock_provider "azapi" {}

variables {
  dev_center_environment_type_dev_center_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test/providers/Microsoft.DevCenter/devCenters/test"
  dev_center_environment_type_name          = "development"
  enable_telemetry                          = false
}

run "preserves_environment_type_configuration" {
  command = apply

  variables {
    dev_center_environment_type_tags = {
      environment = "test"
    }
    dev_center_environment_type_timeouts = {
      create = "45m"
      delete = "40m"
      read   = "10m"
      update = "50m"
    }
  }

  assert {
    condition = (
      azapi_resource.this.parent_id == var.dev_center_environment_type_dev_center_id &&
      azapi_resource.this.name == var.dev_center_environment_type_name &&
      azapi_resource.this.tags.environment == "test" &&
      output.resource_id == azapi_resource.this.id
    )
    error_message = "The AzAPI resource must preserve the Dev Center scope, environment type name, tags, and ID output."
  }

  assert {
    condition = (
      azapi_resource.this.timeouts.create == "45m" &&
      azapi_resource.this.timeouts.delete == "40m" &&
      azapi_resource.this.timeouts.read == "10m" &&
      azapi_resource.this.timeouts.update == "50m"
    )
    error_message = "All custom timeouts must be passed to the AzAPI resource."
  }
}

run "omits_null_timeouts" {
  command = apply

  assert {
    condition     = azapi_resource.this.timeouts == null
    error_message = "Null timeouts must omit the optional timeouts block."
  }
}
