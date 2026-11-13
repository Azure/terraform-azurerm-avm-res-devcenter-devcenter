# TODO: insert locals here.
locals {
  role_definition_resource_substring = "/providers/Microsoft.Authorization/roleDefinitions"

  role_assignments = { for key, ra in var.role_assignments : key => {
    name = uuidv5(
      "11fb06fb-712d-4ddd-98c7-e71bbd588830",
      join("-", [
        azapi_resource.this.id,
        ra.principal_id,
        ra.role_definition_id_or_name,
      ])
    )
    properties = {
      principal_id                           = ra.principal_id
      role_definition_id_or_name             = ra.role_definition_id_or_name
      condition                              = ra.condition
      condition_version                      = ra.condition_version
      delegated_managed_identity_resource_id = ra.delegated_managed_identity_resource_id
      description                            = ra.description
      principal_type                         = ra.principal_type
    }
  } }

  diagnostic_settings_logs_categories   = [for ds in var.diagnostic_settings : ds.log_categories]
  diagnostic_settings_log_groups        = [for ds in var.diagnostic_settings : ds.log_groups]
  diagnostic_settings_metric_categories = [for ds in var.diagnostic_settings : ds.metric_categories]
}
