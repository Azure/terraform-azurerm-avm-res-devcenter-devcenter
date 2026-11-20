mock_provider "azapi" {}

variables {
  dev_center_gallery_dev_center_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test/providers/Microsoft.DevCenter/devCenters/test"
  dev_center_gallery_name              = "test-gallery"
  dev_center_gallery_shared_gallery_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test/providers/Microsoft.Compute/galleries/test"
  enable_telemetry                     = false
}

run "preserves_gallery_association" {
  command = apply

  variables {
    dev_center_gallery_timeouts = {
      create = "45m"
      delete = "40m"
      read   = "10m"
    }
  }

  assert {
    condition = (
      azapi_resource.this.parent_id == var.dev_center_gallery_dev_center_id &&
      azapi_resource.this.name == var.dev_center_gallery_name &&
      azapi_resource.this.body.properties.galleryResourceId == var.dev_center_gallery_shared_gallery_id &&
      output.resource_id == azapi_resource.this.id
    )
    error_message = "The AzAPI gallery association must preserve the Dev Center scope, name, shared gallery ID, and output."
  }

  assert {
    condition = (
      azapi_resource.this.timeouts.create == "45m" &&
      azapi_resource.this.timeouts.delete == "40m" &&
      azapi_resource.this.timeouts.read == "10m"
    )
    error_message = "All custom gallery timeouts must be passed to the AzAPI resource."
  }
}

run "omits_null_timeouts" {
  command = apply

  assert {
    condition     = azapi_resource.this.timeouts == null
    error_message = "Null timeouts must omit the optional timeouts block."
  }
}
