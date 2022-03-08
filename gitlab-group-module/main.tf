resource "gitlab_group" "group" {

  # required
  name = var.name
  path = var.path

  # optional
  description                       = var.description
  auto_devops_enabled               = var.auto_devops_enabled
  default_branch_protection         = var.default_branch_protection
  emails_disabled                   = var.emails_disabled
  lfs_enabled                       = var.lfs_enabled
  mentions_disabled                 = var.mentions_disabled
  parent_id                         = var.parent_id
  project_creation_level            = var.project_creation_level
  request_access_enabled            = var.request_access_enabled
  require_two_factor_authentication = var.require_two_factor_authentication
  share_with_group_lock             = var.share_with_group_lock
  subgroup_creation_level           = var.subgroup_creation_level
  two_factor_grace_period           = var.two_factor_grace_period
  visibility_level                  = var.visibility_level

}

data "gitlab_user" "user" {
  for_each = var.user
  username = each.value.username
}

resource "gitlab_group_membership" "group_membership" {
  for_each = var.user

  group_id = gitlab_group.group.id

  user_id      = data.gitlab_user.user[each.key].user_id
  access_level = each.value.access_level
  expires_at   = each.value.expires_at
}

resource "gitlab_group_membership" "parent_membership" {
  for_each = var.user

  group_id = gitlab_group.group.parent_id

  user_id      = data.gitlab_user.user[each.key].user_id
  access_level = "guest"
  expires_at   = each.value.expires_at
}