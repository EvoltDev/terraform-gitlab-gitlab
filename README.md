# Gitlab Terraform module

Terraform module which can help you to create Gitlab resources and assign membership as you want. This module has three submodules for groups, projects and users. Below you can see how to use them.


terraform import 'module.gitlab-group-module-root.gitlab_group.group["group_1"]' <group_id>

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
```hcl


```
