terraform {
  required_version = ">=1.3"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "evolt"
    workspaces {
      name = "gitlab-module"
    }
  }
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 15.0"
    }
  }
}

provider "gitlab" {
  token = var.gitlab_token
}
