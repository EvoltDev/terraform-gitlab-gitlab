locals {
  created_groups = merge(module.gitlab-group-module-root.created_groups, module.gitlab-group-module-lvl1.created_groups)
}

module "gitlab-group-module-root" {
  source = "../gitlab-group-module"
  providers = {
    gitlab = gitlab
  }
  groups = {
    root_group = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
      id                                = "18694231"
      lfs_enabled                       = true
      mentions_disabled                 = false
      name                              = "dev"
      parent_id                         = 0
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
  source = "../gitlab-group-module"
  providers = {
    gitlab = gitlab
  }
  groups = {
    ennioGroup1 = {
      name      = "ennioGroup1"
      path      = "ennioGroup1path"
      parent_id = module.gitlab-group-module-root.created_groups["root_group"].id
    }
  }
}

module "gitlab-user-module" {
  source = "../gitlab-user-module"
  providers = {
    gitlab = gitlab
  }
  groups = local.created_groups
  users = {
    user_1 = {
      username = "voodoo00065"
      email = "narit35022@snece.com"
      password = "fff+sss1!"
      name = "Voodoo Voodoo"
      groups = {
        ennioGroup1 = {
          access_level = "maintainer"
          expires_at   = null
        }
        root_group = {
          access_level = "guest"
          expires_at   = null
        }
      }
    }
    user_2 = {
      username = "voodoo11165"
      email = "nayan85537@superyp.com"
      password = "fff+sss1!"
      name = "Voodoo Voodoo"
      groups = {
        ennioGroup1 = {
          access_level = "developer"
          expires_at   = null
        }
        root_group = {
          access_level = "guest"
          expires_at   = null
        }
      }
    }
  }
}
