variable "groups" {
  description = "Map for list of groups"
  type = map(object({
    name                              = string
    path                              = string
    auto_devops_enabled               = optional(bool)
    default_branch_protection         = optional(number)
    description                       = optional(string)
    emails_disabled                   = optional(bool)
    lfs_enabled                       = optional(bool)
    mentions_disabled                 = optional(bool)
    parent_id                         = number
    project_creation_level            = optional(string)
    request_access_enabled            = optional(bool)
    require_two_factor_authentication = optional(bool)
    share_with_group_lock             = optional(bool)
    subgroup_creation_level           = optional(string)
    two_factor_grace_period           = optional(number)
    visibility_level                  = optional(string)
  }))
}

variable "gitlab_token" {
  type = string
}

variable "users" {
    type = map(any)
}