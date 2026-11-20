# Azure 

This is the sub-module to Dev Center Gallery

## Features

This module supports:

- Creates Dev Center Gallery

The gallery association is managed with AzAPI, preserving the existing input
variables and custom timeouts. The Dev Center ID is its parent scope, and the
shared gallery ID is sent as `properties.galleryResourceId`. Changing the shared
gallery ID replaces the association.

For existing deployments, a `moved` block targets `azapi_resource.this`. Back up
Terraform state and verify that the migration plan has no unintended destroys or
replacements before applying; state conversion must be tested against the deployed
provider versions.

"Major version Zero (0.y.z) is for initial development. Anything MAY change at any time. The module SHOULD NOT be considered stable till at least it is major version one (1.0.0) or greater. Changes will always be via new versions being published and no changes will be made to existing published versions. For more details please go to <https://semver.org/>"
