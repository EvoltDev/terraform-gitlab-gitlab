locals {
  created_groups = merge(module.gitlab_group_module_dev.created_groups, module.gitlab_group_module_components.created_groups)
}

module "gitlab_group_module_dev" {
  source = "../modules/gitlab-group-module"
  groups = {
    dev = {
      auto_devops_enabled               = false
      default_branch_protection         = 2
      emails_disabled                   = false
      lfs_enabled                       = true
      mentions_disabled                 = false
      name                              = "dev1"
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

module "gitlab_group_module_components" {
  source = "../modules/gitlab-group-module"
  groups = {
    frontend = {
      name      = "Frontend"
      path      = "frontend"
      parent_id = module.gitlab-group-module-dev.created_groups["dev"].id
    }
    backend = {
      name      = "Backend"
      path      = "backend"
      parent_id = module.gitlab-group-module-dev.created_groups["dev"].id
    }
  }
}

module "gitlab_project_module" {
  source = "../modules/gitlab-project-module"
  projects = {
    react_example_project = {
      name         = "React example project"
      namespace_id = local.created_groups["frontend"].id
      push_rules = {
        commit_committer_check = true
      }
    }
    django_example_project = {
      name         = "Django example project"
      namespace_id = local.created_groups["backend"].id
    }
  }
}

module "gitlab_user_module" {
  source   = "../modules/gitlab-user-module"
  groups   = local.created_groups
  projects = module.gitlab-project-module.created_projects
  users = {
    johnharper = {
      create   = false
      username = "john.harper"
      email    = "john.harper@example.com"
      name     = "John Harper"
      groups = {
        frontend = {
          access_level = "maintainer"
          expires_at   = null
        }
        dev = {
          access_level = "guest"
        }
      }
    }
    chrisharper = {
      username = "chris.harper"
      email    = "chris.harper@example.com"
      name     = "Chris Harper"
      groups = {
        backend = {
          access_level = "developer"
          expires_at   = "2030-12-31"
        }
        dev = {
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
