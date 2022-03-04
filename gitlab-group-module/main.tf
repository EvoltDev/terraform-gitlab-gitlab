resource "gitlab_group" "gitlab_group" {
    
    # required
    name        = var.name
    path        = var.path

    # optional
    description = var.description
    auto_devops_enabled = var.auto_devops_enabled
    default_branch_protection = var.default_branch_protection
    emails_disabled = var.emails_disabled
    id = var.id
    lfs_enabled = var.lfs_enabled
    mentions_disabled = var.mentions_disabled
    parent_id = var.parent_id
    project_creation_level = var.project_creation_level
    request_access_enabled = var.request_access_enabled
    require_two_factor_authentication = var.require_two_factor_authentication
    share_with_group_lock = var.share_with_group_lock
    subgroup_creation_level = var.subgroup_creation_level
    two_factor_grace_period = var.two_factor_grace_period
    visibility_level = var.visibility_level

}