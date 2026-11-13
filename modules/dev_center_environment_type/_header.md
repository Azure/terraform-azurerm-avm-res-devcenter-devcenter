# Azure Dev Center Environment Type

This is the sub-module to Dev Center Environment Type

## Features

This module supports:

- Creates Dev Center Environment Type

The environment type is managed with AzAPI, retaining the existing input variables
and custom timeouts. The Dev Center ID is used as its parent scope.

For existing deployments, the `moved` block targets `azapi_resource.this`. Back up
Terraform state and verify that the migration plan has no unintended destroys or
replacements before applying; state conversion must be tested against the deployed
provider versions.

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"
