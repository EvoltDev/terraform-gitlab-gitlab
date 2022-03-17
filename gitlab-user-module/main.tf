locals {

  user_groups = flatten([
    for user_key, user in var.users : [
      for group_key, group in user.groups : {
        user_key     = user_key
        group_key    = group_key
        username     = user.username
        access_level = group.access_level
        expires_at   = group.expires_at
      }
    ]
  ])
}

resource "gitlab_user" "user" {
  for_each = {
    for username, user in var.users : username => user
    if coalesce(user.create, false) != false
    #if user.create != false
  }

  # required
  email    = each.value.email
  name     = each.value.name
  username = each.value.username

  # optional
  #password          = lookup(each.value, "password", "test+123*%")
  can_create_group  = lookup(each.value, "can_create_group", false)
  is_admin          = lookup(each.value, "is_admin", false)
  is_external       = lookup(each.value, "is_external", false)
  note              = lookup(each.value, "note", "")
  projects_limit    = lookup(each.value, "projects_limit", 0)
  reset_password    = lookup(each.value, "reset_password", false)
  skip_confirmation = lookup(each.value, "skip_confirmation", true)
  state             = lookup(each.value, "state", "active")
}

data "gitlab_user" "user" {
  for_each = var.users
  username = each.value.username

  depends_on = [
    gitlab_user.user,
  ]
}

resource "gitlab_group_membership" "group_membership" {
  for_each = {
    for user_group in local.user_groups : "${user_group.user_key}.${user_group.group_key}" => user_group
  }
  group_id     = var.groups[each.value.group_key].id
  user_id      = data.gitlab_user.user[each.value.user_key].user_id
  access_level = each.value.access_level
  expires_at   = lookup(each.value, "expires_at", null)
}