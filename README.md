# Gitlab Terraform module

Terraform module which can help you to create Gitlab resources and assign membership as you want. This module has three submodules for groups, projects and users. Below you can see how to use them.

## Gitlab groups

First of all for Gitlab.com you must create root group thought browser and use import command to add that group in state.

Import command:
```
terraform import 'module.gitlab-group-module-dev.gitlab_group.group["dev"]' <group_id>
```

### Module usage:

```hcl
module "gitlab-group-module-components" {
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
```

## Gitlab projects
Use this submodule to create projects on you Gitlab instance or Gitlab.com.

### Module usage:
```hcl
module "gitlab-project-module" {
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
```

## Gitlab users
Use this submodule to create users and asign membership to groups or projects.

### Module usage:
```hcl
module "gitlab-user-module" {
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
```

## License

Apache 2 Licensed. See [LICENSE](https://github.com/EvoltDev/terraform-gitlab-module/blob/main/LICENCE) for full details.