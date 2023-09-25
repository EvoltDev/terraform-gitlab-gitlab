terraform {
  required_version = ">=1.3"

  experiments = [module_variable_optional_attrs]

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 16.3"
    }
  }
}
