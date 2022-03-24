variable "users" {
  description = "Map for list of users with groups and projects membership"
  type = map(object({
    create   = optional(bool)
    username = string
    email    = string
    name     = string
    groups = map(object({
      access_level = string
      expires_at   = optional(string) #format: YYYY-MM-DD
    }))
    projects = optional(map(object({
      access_level = string
    })))
  }))
}

variable "groups" {
  description = "Map for list of groups"
  type = map(object({
    id                                = number
    name                              = string
    path                              = string
    auto_devops_enabled               = optional(bool)
    default_branch_protection         = optional(number)
    description                       = optional(string)
    emails_disabled                   = optional(bool)
    lfs_enabled                       = optional(bool)
    mentions_disabled                 = optional(bool)
    parent_id                         = number
    project_creation_level            = optional(string)
    request_access_enabled            = optional(bool)
    require_two_factor_authentication = optional(bool)
    share_with_group_lock             = optional(bool)
    subgroup_creation_level           = optional(string)
    two_factor_grace_period           = optional(number)
    visibility_level                  = optional(string)
  }))
}

variable "projects" {
  description = "Map for list of projects"
  type = map(object({
    id                                               = number
    name                                             = string
    namespace_id                                     = number
    allow_merge_on_skipped_pipeline                  = optional(bool)
    approvals_before_merge                           = optional(number)
    archive_on_destroy                               = optional(bool)
    archived                                         = optional(bool)
    build_coverage_regex                             = optional(string)
    ci_config_path                                   = optional(string)
    ci_forward_deployment_enabled                    = optional(bool)
    container_registry_enabled                       = optional(bool)
    default_branch                                   = optional(string)
    description                                      = optional(string)
    group_with_project_templates_id                  = optional(number)
    import_url                                       = optional(string)
    initialize_with_readme                           = optional(bool)
    issues_enabled                                   = optional(bool)
    issues_template                                  = optional(string)
    lfs_enabled                                      = optional(bool)
    merge_method                                     = optional(string)
    merge_pipelines_enabled                          = optional(bool)
    merge_requests_enabled                           = optional(bool)
    merge_requests_template                          = optional(string)
    merge_trains_enabled                             = optional(bool)
    mirror                                           = optional(bool)
    mirror_overwrites_diverged_branches              = optional(bool)
    mirror_trigger_builds                            = optional(bool)
    only_allow_merge_if_all_discussions_are_resolved = optional(bool)
    only_allow_merge_if_pipeline_succeeds            = optional(bool)
    only_mirror_protected_branches                   = optional(bool)
    packages_enabled                                 = optional(bool)
    pages_access_level                               = optional(string)
    path                                             = optional(string)
    pipelines_enabled                                = optional(bool)
    printing_merge_request_link_enabled              = optional(bool)
    push_rules                                       = optional(any)
    remove_source_branch_after_merge                 = optional(bool)
    request_access_enabled                           = optional(bool)
    shared_runners_enabled                           = optional(bool)
    snippets_enabled                                 = optional(bool)
    squash_option                                    = optional(string)
    tags                                             = optional(list(string))
    template_name                                    = optional(string)
    template_project_id                              = optional(number)
    use_custom_template                              = optional(bool)
    visibility_level                                 = optional(string)
    wiki_enabled                                     = optional(bool)
  }))
}