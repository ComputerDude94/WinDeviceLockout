# Specify the usernames to keep - Domain must be Typed as Domain\UserName,
$allowedUsers = @("")

# Get the local Administrators group
$adminGroup = Get-LocalGroup -Name Administrators

# Get the current members of the Administrators group
$currentMembers = Get-LocalGroupMember -Group $adminGroup

# Remove users from the Administrators group except the allowed ones and those containing "" or "" in their names
foreach ($user in $currentMembers) {
    $userName = $user.Name
    if ($userName -notin $allowedUsers -and ($userName -like "**" -or $userName -like "**")) {
        Write-Host "Removing user $($user.Name) from Administrators group."
        Remove-LocalGroupMember -Group $adminGroup -Member $userName -Confirm:$false
    }
}

Write-Host "Users removed from Administrators group, except specified users and those containing '' or '' in their names."