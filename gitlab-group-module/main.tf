locals {
  user_groups = flatten([
    for user_key, user in var.users : [
      for group_key, group in user.groups : {
        user_key      = user_key
        group_key     = group_key
        username      = user.username
        access_level  = group.access_level
        expires_at    = group.expires_at
        group_id      = data.gitlab_group.group[group_key].id
        root_group_id = user.root_group_id
      }
    ]
  ])
}

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
  parent_id                         = lookup(each.value, "parent_id", 0)
  project_creation_level            = lookup(each.value, "project_creation_level", "Maintainer")
  request_access_enabled            = lookup(each.value, "request_access_enabled", false)
  require_two_factor_authentication = lookup(each.value, "require_two_factor_authentication", false)
  share_with_group_lock             = lookup(each.value, "share_with_group_lock", false)
  subgroup_creation_level           = lookup(each.value, "subgroup_creation_level", "Owner")
  two_factor_grace_period           = lookup(each.value, "two_factor_grace_period", 48)
  visibility_level                  = lookup(each.value, "visibility_level", "private")

}

data "gitlab_group" "group" {
  for_each = gitlab_group.group
  group_id = each.value.id
}

data "gitlab_user" "user" {
  for_each = var.users
  username = each.value.username
}

resource "gitlab_group_membership" "group_membership" {
  for_each = {
    for user_group in local.user_groups : "${user_group.user_key}.${user_group.group_key}" => user_group
  }
  group_id     = each.value.group_id
  user_id      = data.gitlab_user.user[each.value.user_key].user_id
  access_level = each.value.access_level
  expires_at   = each.value.expires_at

  depends_on = [
    gitlab_group_membership.parent_membership,
  ]
}

resource "gitlab_group_membership" "parent_membership" {
  for_each = {
    for user_group in local.user_groups : "${user_group.user_key}.${user_group.group_key}" => user_group if user_group.root_group_id != 0
  }
  group_id     = each.value.root_group_id
  user_id      = data.gitlab_user.user[each.value.user_key].user_id
  access_level = "guest"
  expires_at   = each.value.expires_at
}