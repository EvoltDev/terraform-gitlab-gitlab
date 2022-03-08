variable "name" {
  description = "Group name"
  default     = "default_group_name"
  type        = string
}

variable "path" {
  description = "Group path"
  default     = "default_group_path"
  type        = string
}

variable "description" {
  description = "Group description"
  default     = "default_group_descrption"
  type        = string
}

variable "auto_devops_enabled" {
  description = "Group auto devops enabled"
  default     = false
  type        = bool
}

variable "default_branch_protection" {
  description = "Group default branch protection"
  default     = 2
  type        = number
}

variable "emails_disabled" {
  description = "Group emails disabled"
  default     = false
  type        = bool
}

variable "id" {
  description = "Group id"
  type        = string
  default     = null
}

variable "lfs_enabled" {
  description = "Group LFS enabled"
  type        = bool
  default     = true
}

variable "mentions_disabled" {
  description = "Group mentions disalbed"
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "Group parent id"
  type        = number
  default     = null
}

variable "project_creation_level" {
  description = "Group project creation level"
  type        = string
  default     = "Maintainer"
}

variable "request_access_enabled" {
  description = "Group request access enabled"
  type        = bool
  default     = false
}

variable "require_two_factor_authentication" {
  description = "Group require two factor authentication"
  type        = bool
  default     = false
}

variable "share_with_group_lock" {
  description = "Group share with group lock"
  type        = bool
  default     = false
}

variable "subgroup_creation_level" {
  description = "Group subgroup creation level"
  type        = string
  default     = "Owner"
}

variable "two_factor_grace_period" {
  description = "Group two factor grace period"
  type        = number
  default     = 48
}

variable "visibility_level" {
  description = "Group visibility level"
  type        = string
  default     = "private"
}

variable "user" {
  description = "Map for list of users"
  type        = map(any)
  default = {
    user_1 = {
      username     = null
      access_level = null
      expires_at   = null
    }
  }
}

variable "gitlab_token" {
  type = string
}