terraform {
  required_version = ">=1.1.6"

  experiments = [module_variable_optional_attrs]

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 15.0"
    }
  }
}
