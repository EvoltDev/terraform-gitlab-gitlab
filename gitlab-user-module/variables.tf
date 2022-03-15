variable "gitlab_token" {
  type = string
}

variable "users" {
  type = map(any)
}

variable "root_group_id" {
  type    = number
  default = 0
}

variable "groups" {
  type = map(any)
}