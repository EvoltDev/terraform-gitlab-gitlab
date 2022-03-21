locals {
  created_groups = merge(module.gitlab-group-module-root.created_groups, module.gitlab-group-module-lvl1.created_groups)
}

module "gitlab-group-module-root" {
  source = "../gitlab-group-module"
  groups = {
    root_group = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
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
  groups = {
    ennioGroup1 = {
      name      = "ennioGroup1"
      path      = "ennioGroup1path"
      parent_id = module.gitlab-group-module-root.created_groups["root_group"].id
    }
  }
}

module "gitlab-project-module" {
  source = "../gitlab-project-module"
  projects = {
    react_test_project = {
      name         = "React test project"
      namespace_id = local.created_groups["ennioGroup1"].id
      push_rules =  {
        commit_committer_check = true
      }
    }
  }
}

module "gitlab-user-module" {
  source   = "../gitlab-user-module"
  groups   = local.created_groups
  projects = module.gitlab-project-module.created_projects
  users = {
    voodoo000 = {
      create   = false
      username = "voodoo000"
      email    = "narit35022@snece.com"
      name     = "Voodoo Voodoo"
      groups = {
        ennioGroup1 = {
          access_level = "maintainer"
          expires_at   = null
        }
        root_group = {
          access_level = "guest"
        }
      }
    }
    voodoo111 = {
      username = "voodoo111"
      email    = "nayan85537@superyp.com"
      name     = "Voodoo Voodoo"
      groups = {
        ennioGroup1 = {
          access_level = "developer"
          expires_at   = "2030-12-31"
        }
        root_group = {
          access_level = "guest"
          expires_at   = "2030-12-31"
        }
      }
      projects = {
        react_test_project = {
          access_level = "maintainer"
        }
      }
    }
  }
}

# push real examples so clients can easly understand module