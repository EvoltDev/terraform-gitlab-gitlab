resource "gitlab_user" "user" {
  for_each = var.users

  # required
  email    = each.value.email
  name     = each.value.name
  username = each.value.username

  # optional
  can_create_group  = lookup(each.value, "can_create_group", false)
  is_admin          = lookup(each.value, "is_admin", false)
  is_external       = lookup(each.value, "is_external", false)
  note              = lookup(each.value, "note", "")
  password          = lookup(each.value, "password", "fff+sss$4")
  projects_limit    = lookup(each.value, "projects_limit", 0)
  reset_password    = lookup(each.value, "reset_password", false)
  skip_confirmation = lookup(each.value, "skip_confirmation", true)
  state             = lookup(each.value, "state", "active")
}