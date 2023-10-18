<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~>15.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~>15.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project.project](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_projects"></a> [projects](#input\_projects) | Map for list of projects | <pre>map(object({<br>    name                                             = string<br>    namespace_id                                     = number<br>    allow_merge_on_skipped_pipeline                  = optional(bool)<br>    approvals_before_merge                           = optional(number)<br>    archive_on_destroy                               = optional(bool)<br>    archived                                         = optional(bool)<br>    build_coverage_regex                             = optional(string)<br>    ci_config_path                                   = optional(string)<br>    ci_forward_deployment_enabled                    = optional(bool)<br>    container_registry_enabled                       = optional(bool)<br>    default_branch                                   = optional(string)<br>    description                                      = optional(string)<br>    group_with_project_templates_id                  = optional(number)<br>    import_url                                       = optional(string)<br>    initialize_with_readme                           = optional(bool)<br>    issues_enabled                                   = optional(bool)<br>    issues_template                                  = optional(string)<br>    lfs_enabled                                      = optional(bool)<br>    merge_method                                     = optional(string)<br>    merge_pipelines_enabled                          = optional(bool)<br>    merge_requests_enabled                           = optional(bool)<br>    merge_requests_template                          = optional(string)<br>    merge_trains_enabled                             = optional(bool)<br>    mirror                                           = optional(bool)<br>    mirror_overwrites_diverged_branches              = optional(bool)<br>    mirror_trigger_builds                            = optional(bool)<br>    only_allow_merge_if_all_discussions_are_resolved = optional(bool)<br>    only_allow_merge_if_pipeline_succeeds            = optional(bool)<br>    only_mirror_protected_branches                   = optional(bool)<br>    packages_enabled                                 = optional(bool)<br>    pages_access_level                               = optional(string)<br>    path                                             = optional(string)<br>    pipelines_enabled                                = optional(bool)<br>    printing_merge_request_link_enabled              = optional(bool)<br>    push_rules = optional(object({<br>      commit_committer_check        = optional(bool)<br>      deny_delete_tag               = optional(bool)<br>      max_file_size                 = optional(number)<br>      member_check                  = optional(bool)<br>      prevent_secrets               = optional(bool)<br>      reject_unsigned_commits       = optional(bool)<br>      author_email_regex            = optional(string)<br>      branch_name_regex             = optional(string)<br>      commit_message_negative_regex = optional(string)<br>      commit_message_regex          = optional(string)<br>      file_name_regex               = optional(string)<br>      })<br>    )<br>    remove_source_branch_after_merge = optional(bool)<br>    request_access_enabled           = optional(bool)<br>    shared_runners_enabled           = optional(bool)<br>    snippets_enabled                 = optional(bool)<br>    squash_option                    = optional(string)<br>    tags                             = optional(list(string))<br>    template_name                    = optional(string)<br>    template_project_id              = optional(number)<br>    use_custom_template              = optional(bool)<br>    visibility_level                 = optional(string)<br>    wiki_enabled                     = optional(bool)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_projects"></a> [created\_projects](#output\_created\_projects) | List of created projects with module |
<!-- END_TF_DOCS -->
