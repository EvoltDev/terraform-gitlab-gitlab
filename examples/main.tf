locals {
  created_groups = merge(module.gitlab-group-module-developers.created_groups, module.gitlab-group-module-frontend.created_groups)
}

module "gitlab-group-module-developers" {
  source = "../gitlab-group-module"
  groups = {
    developers = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
      lfs_enabled                       = true
      mentions_disabled                 = false
      name                              = "developers"
      parent_id                         = 0
      path                              = "dev2284"
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

module "gitlab-group-module-frontend" {
  source = "../gitlab-group-module"
  groups = {
    react = {
      name      = "React"
      path      = "react"
      parent_id = module.gitlab-group-module-developers.created_groups["developers"].id
    }
  }
}

module "gitlab-project-module" {
  source = "../gitlab-project-module"
  projects = {
    react_example_project = {
      name         = "React example project"
      namespace_id = local.created_groups["react"].id
      push_rules = {
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
    johnharper = {
      create   = false
      username = "john.harper"
      email    = "john.harper@example.com"
      name     = "John Harper"
      groups = {
        react = {
          access_level = "maintainer"
          expires_at   = null
        }
        developers = {
          access_level = "guest"
        }
      }
    }
    chrisharper = {
      username = "chris.harper"
      email    = "chris.harper@example.com"
      name     = "Chris Harper"
      groups = {
        react = {
          access_level = "developer"
          expires_at   = "2030-12-31"
        }
        developers = {
          access_level = "guest"
          expires_at   = "2030-12-31"
        }
      }
      projects = {
        react_example_project = {
          access_level = "maintainer"
        }
      }
    }
  }
}