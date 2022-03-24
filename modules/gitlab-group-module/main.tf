resource "gitlab_group" "group" {
  for_each = var.groups

  # required
  name = each.value.name
  path = each.value.path

  # optional
  auto_devops_enabled               = lookup(each.value, "auto_devops_enabled", false)
  default_branch_protection         = lookup(each.value, "default_branch_protection", 2)
  description                       = lookup(each.value, "description", "default_description")
  emails_disabled                   = lookup(each.value, "emails_disabled", false)
  lfs_enabled                       = lookup(each.value, "lfs_enabled", true)
  mentions_disabled                 = lookup(each.value, "mentions_disabled", false)
  parent_id                         = lookup(each.value, "parent_id", var.parent_id)
  project_creation_level            = lookup(each.value, "project_creation_level", "Maintainer")
  request_access_enabled            = lookup(each.value, "request_access_enabled", false)
  require_two_factor_authentication = lookup(each.value, "require_two_factor_authentication", false)
  share_with_group_lock             = lookup(each.value, "share_with_group_lock", false)
  subgroup_creation_level           = lookup(each.value, "subgroup_creation_level", "Owner")
  two_factor_grace_period           = lookup(each.value, "two_factor_grace_period", 48)
  visibility_level                  = lookup(each.value, "visibility_level", "private")
}
