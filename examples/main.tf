module "gitlab-group-module-root" {
  source       = "../gitlab-group-module"
  gitlab_token = var.gitlab_token
  groups = {
    root_group = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
      id                                = "18694231"
      lfs_enabled                       = true
      mentions_disabled                 = false
      name                              = "dev"
      parent_key                        = null
      path                              = "dev2249"
      project_creation_level            = "developer"
      request_access_enabled            = true
      require_two_factor_authentication = false
      share_with_group_lock             = false
      subgroup_creation_level           = "maintainer"
      two_factor_grace_period           = 48
      visibility_level                  = "private"
    }
  }

}

module "gitlab-group-module-lvl1" {
  source        = "../gitlab-group-module"
  gitlab_token  = var.gitlab_token
  parent_groups = module.gitlab-group-module-root.created_groups

  groups = {
    ennioGroup1 = {
      name       = "ennioGroup1"
      path       = "ennioGroup1path"
      parent_key = "root_group"
    }
  }
}

module "gitlab-user-module" {
  source        = "../gitlab-user-module"
  gitlab_token  = var.gitlab_token
  root_group_id = module.gitlab-group-module-root.created_groups["root_group"].id
  groups        = module.gitlab-group-module-lvl1.created_groups
  users = {
    user_1 = {
      username = "voodoo000"
      groups = {
        ennioGroup1 = {
          access_level = "maintainer"
          expires_at   = null
        }
      }
    }
    user_2 = {
      username = "voodoo111"
      groups = {
        ennioGroup1 = {
          access_level = "developer"
          expires_at   = null
        }
      }
    }
  }
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "evolt"
    workspaces {
      name = "gitlab-module"
    }
  }
}
