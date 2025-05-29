<!-- BEGIN_TF_DOCS -->
# Azure Dev Center Project

This is the sub-module to deploy Dev Center Project

## Features

This module supports:

- Creates Dev Center Project

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71, < 5.0.0)

## Resources

The following resources are used by this module:

- [azurerm_dev_center_project.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_project) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_dev_center_project_dev_center_id"></a> [dev\_center\_project\_dev\_center\_id](#input\_dev\_center\_project\_dev\_center\_id)

Description: (Required) Specifies the ID of the Dev Center within which this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created.

Type: `string`

### <a name="input_dev_center_project_location"></a> [dev\_center\_project\_location](#input\_dev\_center\_project\_location)

Description: (Required) Specifies the Azure Region where this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created.

Type: `string`

### <a name="input_dev_center_project_name"></a> [dev\_center\_project\_name](#input\_dev\_center\_project\_name)

Description: (Required) Specifies the name of the Dev Center Project. Changing this forces a new Dev Center Project to be created.

Type: `string`

### <a name="input_dev_center_project_resource_group_name"></a> [dev\_center\_project\_resource\_group\_name](#input\_dev\_center\_project\_resource\_group\_name)

Description: (Required) Specifies the name of the Resource Group within which this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_dev_center_project_description"></a> [dev\_center\_project\_description](#input\_dev\_center\_project\_description)

Description: (Optional) Specifies the description of the Dev Center Project. Changing this forces a new Dev Center Project to be created.

Type: `string`

Default: `null`

### <a name="input_dev_center_project_maximum_dev_boxes_per_user"></a> [dev\_center\_project\_maximum\_dev\_boxes\_per\_user](#input\_dev\_center\_project\_maximum\_dev\_boxes\_per\_user)

Description: (Optional) Specifies the maximum number of Dev Boxes that can be created per user in this Dev Center Project. Defaults to 1 if not specified.

Type: `number`

Default: `1`

### <a name="input_dev_center_project_tags"></a> [dev\_center\_project\_tags](#input\_dev\_center\_project\_tags)

Description: (Optional) A mapping of tags which should be assigned to the Dev Center Project. Changing this forces a new Dev Center Project to be created.

Type: `map(string)`

Default: `null`

### <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities)

Description: Controls the Managed Identity configuration on this resource. The following properties can be specified:

- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.
- `user_assigned_resource_ids` - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.

Type:

```hcl
object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
```

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_resource"></a> [resource](#output\_resource)

Description: The Dev Center Project resource.

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The ID of the Dev Center Project.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->