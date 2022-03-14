module "gitlab-group-module-root" {
  source       = "../gitlab-group-module"
  gitlab_token = var.gitlab_token
  groups = {
    group_1 = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
      id                                = "16900903"
      lfs_enabled                       = true
      mentions_disabled                 = false
      name                              = "dev"
      parent_id                         = 0
      path                              = "d6753"
      project_creation_level            = "developer"
      request_access_enabled            = true
      require_two_factor_authentication = false
      share_with_group_lock             = false
      subgroup_creation_level           = "maintainer"
      two_factor_grace_period           = 48
      visibility_level                  = "private"
    }
  }

  users = {}

}

module "gitlab-group-module" {
  source       = "../gitlab-group-module"
  gitlab_token = var.gitlab_token
  groups = {
    group_1 = {
      name      = "ennioGroup1"
      path      = "ennioGroup1path"
      parent_id = module.gitlab-group-module-root.created_groups["group_1"].id

    }
  }
  users = {
    user_1 = {
      username      = "voodoo000"
      root_group_id = module.gitlab-group-module-root.created_groups["group_1"].id
      groups = {
        group_1 = {
          access_level = "maintainer"
          expires_at   = null
        }
      }
    }
    user_2 = {
      username      = "voodoo111"
      root_group_id = module.gitlab-group-module-root.created_groups["group_1"].id
      groups = {
        group_1 = {
          access_level = "maintainer"
          expires_at   = null
        }
      }
    }
  }
}

terraform {
  backend "remote" {
    organization = "evolt"
    workspaces { name = "gitlab-module" }
  }
}
