# Azure Dev Box Definition

This is the sub-module to Dev Box Definition

## Features

This module supports:

- Create Dev Box Definition

The Dev Box Definition is managed with AzAPI using the existing input variables.
The Dev Center ID is its parent scope; the image reference and SKU are sent as
`properties.imageReference.id` and `properties.sku.name`. Custom timeouts remain
configurable through `dev_center_dev_box_definition_timeouts`.

For existing deployments, a `moved` block targets `azapi_resource.this`. Back up
Terraform state before upgrading and verify that the migration plan has no
unintended destroys or replacements. State conversion must be tested against the
deployed provider versions before applying.

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"
