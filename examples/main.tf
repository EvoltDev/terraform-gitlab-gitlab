module "gitlab-group-module-root" {
  source = "../gitlab-group-module"
  

}

module "gitlab-group-module" {
  source = "../gitlab-group-module"
  gitlab_token = "glpat-3QiR__myVgzux6pREKzn"
groups = {
  group_1 = {
    name      = "ennioGroup1"
    path      = "ennioGroup1path"
    parent_id = module.gitlab-group-module-root[0].group_id
    
  }
}
users = {
      user_1 = {
        username      = "voodoo000"
        access_level  = "maintainer"
        expires_at    = null
        root_group_id = module.gitlab-group-module-root[0].group_id
        groups = {
            group_1 = {
                access_level  = "maintainer"
                expires_at    = null
                root_group_id = module.gitlab-group-module-root[0].group_id
            }
      }
      }
      user_2 = {
        username      = "voodoo111"
        groups = {
            group_1 = {
                access_level  = "developer"
                expires_at    = null
                root_group_id = module.gitlab-group-module-root[0].group_id
            }
      }
      }
    }
}