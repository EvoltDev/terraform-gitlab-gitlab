<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.6 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 3.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 3.11.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_group_membership.group_membership](https://registry.terraform.io/providers/gitlabhq/gitlab/3.11.1/docs/resources/group_membership) | resource |
| [gitlab_project_membership.project_membership](https://registry.terraform.io/providers/gitlabhq/gitlab/3.11.1/docs/resources/project_membership) | resource |
| [gitlab_user.user](https://registry.terraform.io/providers/gitlabhq/gitlab/3.11.1/docs/resources/user) | resource |
| [gitlab_user.user](https://registry.terraform.io/providers/gitlabhq/gitlab/3.11.1/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | Map for list of groups | <pre>map(object({<br>    id                                = number<br>    name                              = string<br>    path                              = string<br>    auto_devops_enabled               = optional(bool)<br>    default_branch_protection         = optional(number)<br>    description                       = optional(string)<br>    emails_disabled                   = optional(bool)<br>    lfs_enabled                       = optional(bool)<br>    mentions_disabled                 = optional(bool)<br>    parent_id                         = number<br>    project_creation_level            = optional(string)<br>    request_access_enabled            = optional(bool)<br>    require_two_factor_authentication = optional(bool)<br>    share_with_group_lock             = optional(bool)<br>    subgroup_creation_level           = optional(string)<br>    two_factor_grace_period           = optional(number)<br>    visibility_level                  = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_projects"></a> [projects](#input\_projects) | Map for list of projects | <pre>map(object({<br>    id                                               = number<br>    name                                             = string<br>    namespace_id                                     = number<br>    allow_merge_on_skipped_pipeline                  = optional(bool)<br>    approvals_before_merge                           = optional(number)<br>    archive_on_destroy                               = optional(bool)<br>    archived                                         = optional(bool)<br>    build_coverage_regex                             = optional(string)<br>    ci_config_path                                   = optional(string)<br>    ci_forward_deployment_enabled                    = optional(bool)<br>    container_registry_enabled                       = optional(bool)<br>    default_branch                                   = optional(string)<br>    description                                      = optional(string)<br>    group_with_project_templates_id                  = optional(number)<br>    import_url                                       = optional(string)<br>    initialize_with_readme                           = optional(bool)<br>    issues_enabled                                   = optional(bool)<br>    issues_template                                  = optional(string)<br>    lfs_enabled                                      = optional(bool)<br>    merge_method                                     = optional(string)<br>    merge_pipelines_enabled                          = optional(bool)<br>    merge_requests_enabled                           = optional(bool)<br>    merge_requests_template                          = optional(string)<br>    merge_trains_enabled                             = optional(bool)<br>    mirror                                           = optional(bool)<br>    mirror_overwrites_diverged_branches              = optional(bool)<br>    mirror_trigger_builds                            = optional(bool)<br>    only_allow_merge_if_all_discussions_are_resolved = optional(bool)<br>    only_allow_merge_if_pipeline_succeeds            = optional(bool)<br>    only_mirror_protected_branches                   = optional(bool)<br>    packages_enabled                                 = optional(bool)<br>    pages_access_level                               = optional(string)<br>    path                                             = optional(string)<br>    pipelines_enabled                                = optional(bool)<br>    printing_merge_request_link_enabled              = optional(bool)<br>    push_rules                                       = optional(any)<br>    remove_source_branch_after_merge                 = optional(bool)<br>    request_access_enabled                           = optional(bool)<br>    shared_runners_enabled                           = optional(bool)<br>    snippets_enabled                                 = optional(bool)<br>    squash_option                                    = optional(string)<br>    tags                                             = optional(list(string))<br>    template_name                                    = optional(string)<br>    template_project_id                              = optional(number)<br>    use_custom_template                              = optional(bool)<br>    visibility_level                                 = optional(string)<br>    wiki_enabled                                     = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | Map for list of users with groups and projects membership | <pre>map(object({<br>    create   = optional(bool)<br>    username = string<br>    email    = string<br>    name     = string<br>    groups = map(object({<br>      access_level = string<br>      expires_at   = optional(string) #format: YYYY-MM-DD<br>    }))<br>    projects = optional(map(object({<br>      access_level = string<br>    })))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_users"></a> [created\_users](#output\_created\_users) | List of created users with module |
<!-- END_TF_DOCS -->
