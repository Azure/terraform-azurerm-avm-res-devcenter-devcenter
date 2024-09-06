<!-- BEGIN_TF_DOCS -->
# Azure Dev Center Environment Type

This is the sub-module to Dev Center Environment Type

## Features

This module supports:

- Creates Dev Center Environment Type

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.71)

## Resources

The following resources are used by this module:

- [azurerm_dev_center_environment_type.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_environment_type) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_dev_center_environment_type_dev_center_id"></a> [dev\_center\_environment\_type\_dev\_center\_id](#input\_dev\_center\_environment\_type\_dev\_center\_id)

Description: (Required) The ID of the associated Dev Center. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_dev_center_environment_type_name"></a> [dev\_center\_environment\_type\_name](#input\_dev\_center\_environment\_type\_name)

Description: (Required) Specifies the name of this Dev Center Environment Type. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_dev_center_environment_type_tags"></a> [dev\_center\_environment\_type\_tags](#input\_dev\_center\_environment\_type\_tags)

Description: (Optional) A mapping of tags which should be assigned to the Dev Center Environment Type.

Type: `map(string)`

Default: `null`

### <a name="input_dev_center_environment_type_timeouts"></a> [dev\_center\_environment\_type\_timeouts](#input\_dev\_center\_environment\_type\_timeouts)

Description: - `create` - (Defaults to 30 minutes) Used when creating this Dev Center Environment Type.
- `delete` - (Defaults to 30 minutes) Used when deleting this Dev Center Environment Type.
- `read` - (Defaults to 5 minutes) Used when retrieving this Dev Center Environment Type.
- `update` - (Defaults to 30 minutes) Used when updating this Dev Center Environment Type.

Type:

```hcl
object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
```

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The ID of the Dev Center Catalog.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->