# required AVM resources interfaces
moved {
  from = azurerm_management_lock.this
  to   = azapi_resource.lock
}

resource "azapi_resource" "lock" {
  count = var.lock != null ? 1 : 0

  type      = "Microsoft.Authorization/locks@2020-05-01"
  name      = coalesce(var.lock.name, "lock-${var.lock.kind}")
  parent_id = azapi_resource.this.id
  body = {
    properties = {
      level = var.lock.kind
      notes = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
    }
  }
}

moved {
  from = azurerm_role_assignment.this
  to   = azapi_resource.role_assignments
}

resource "azapi_resource" "role_assignments" {
  for_each = local.role_assignments

  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = each.value.name
  parent_id = azapi_resource.this.id
  body = {
    properties = {
      condition                          = each.value.properties.condition
      conditionVersion                   = each.value.properties.condition_version
      delegatedManagedIdentityResourceId = each.value.properties.delegated_managed_identity_resource_id
      description                        = each.value.properties.description
      principalId                        = each.value.properties.principal_id
      principalType                      = each.value.properties.principal_type
      roleDefinitionId                   = each.value.properties.role_definition_id_or_name
    }
  }
}

moved {
  from = azurerm_dev_center.this
  to   = azapi_resource.this
}

locals {
  resource_group_name = split("/", var.parent_id)[4]
}

resource "azapi_resource" "this" {
  type      = "Microsoft.DevCenter/devCenters@2025-02-01"
  location  = var.location
  name      = var.dev_center_name
  parent_id = var.parent_id

  dynamic "identity" {
    for_each = var.dev_center_identity == null ? [] : [var.dev_center_identity]

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  body                   = {}
  tags                   = var.tags
  response_export_values = ["properties.devCenterUri"]

  dynamic "timeouts" {
    for_each = var.dev_center_timeouts == null ? [] : [var.dev_center_timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

locals {
  resource_block = {
    id                                            = azapi_resource.this.id
    name                                          = azapi_resource.this.name
    resource_group_name                           = local.resource_group_name
    location                                      = azapi_resource.this.location
    user_assigned_managed_identity_principal_id   = try(var.dev_center_identity.type == "UserAssigned", false) ? azapi_resource.this.identity[0].principal_id : null
    system_assigned_managed_identity_principal_id = try(var.dev_center_identity.type == "SystemAssigned", false) ? azapi_resource.this.identity[0].principal_id : null
    dev_center_uri                                = azapi_resource.this.output.properties.devCenterUri
  }
}

resource "azapi_resource" "diagnostic_settings" {
  for_each = var.diagnostic_settings

  type                   = "Microsoft.Insights/diagnosticSettings@2021-05-01-preview"
  name                   = each.value.name != null ? each.value.name : "diag-${var.dev_center_name}"
  parent_id              = azapi_resource.this.id
  ignore_null_property   = true
  response_export_values = []

  body = {
    properties = {
      eventHubAuthorizationRuleId = each.value.event_hub_authorization_rule_resource_id
      eventHubName                = each.value.event_hub_name
      logAnalyticsDestinationType = each.value.log_analytics_destination_type
      workspaceId                 = each.value.workspace_resource_id
      marketplacePartnerId        = each.value.marketplace_partner_resource_id
      storageAccountId            = each.value.storage_account_resource_id
      logs = concat(
        [for category in each.value.log_categories : {
          category = category
          enabled  = true
        }],
        [for group in each.value.log_groups : {
          categoryGroup = group
          enabled       = true
        }]
      )
      metrics = [for category in each.value.metric_categories : {
        category = category
        enabled  = true
      }]
    }
  }

  lifecycle {
    precondition {
      condition     = length(each.value.log_categories) + length(each.value.log_groups) + length(each.value.metric_categories) > 0
      error_message = "Each diagnostic setting must enable at least one log category, log group, or metric category."
    }
  }
}

moved {
  from = azurerm_monitor_diagnostic_setting.this
  to   = azapi_resource.diagnostic_settings
}
