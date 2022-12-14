$tenantName = "TenantNameHere"
# First, connect to MS graph
Connect-MgGraph -Tenant "$tenantName.onmicrosoft.com" -Scopes "RoleManagement.ReadWrite.Directory" 

# Make sure this module is installed. FYI, "Enrolment" is not a typo
Import-Module Microsoft.Graph.DeviceManagement.Enrolment

$params = @{
	Description = "Grants permission to grant admin consent on app registrations"
	DisplayName = "Application Registration Consent Admin"
	RolePermissions = @(
		@{
            # Replace this block with whichever permissions you'd like to add to this role
			AllowedResourceActions = @(
				"microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-application-admin"
			)
		}
	)
	IsEnabled = $true
}

New-MgRoleManagementDirectoryRoleDefinition -BodyParameter $params
