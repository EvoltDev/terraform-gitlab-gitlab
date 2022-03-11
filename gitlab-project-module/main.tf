resource "gitlab_project" "project" {

  for_each = var.projects

  # required

  name         = each.value.name
  namespace_id = each.value.namespace_id

  # optional

  allow_merge_on_skipped_pipeline                  = lookup(each.value, "allow_merge_on_skipped_pipeline", false)
  pprovals_before_merge                            = lookup(each.value, "pprovals_before_merge", 0)
  archive_on_destroy                               = lookup(each.value, "archive_on_destroy", null)
  archived                                         = lookup(each.value, "archived", false)
  build_coverage_regex                             = lookup(each.value, "build_coverage_regex", "")
  ci_config_path                                   = lookup(each.value, "ci_config_path", "")
  ci_forward_deployment_enabled                    = lookup(each.value, "ci_forward_deployment_enabled", true)
  container_registry_enabled                       = lookup(each.value, "container_registry_enabled", true)
  default_branch                                   = lookup(each.value, "default_branch", "main")
  description                                      = lookup(each.value, "description", "")
  group_with_project_templates_id                  = lookup(each.value, "group_with_project_templates_id", null)
  import_url                                       = lookup(each.value, "import_url", null)
  initialize_with_readme                           = lookup(each.value, "initialize_with_readme", null)
  issues_enabled                                   = lookup(each.value, "issues_enabled", true)
  issues_template                                  = lookup(each.value, "issues_template", "")
  lfs_enabled                                      = lookup(each.value, "lfs_enabled", true)
  merge_method                                     = lookup(each.value, "merge_method", "merge")
  merge_pipelines_enabled                          = lookup(each.value, "merge_pipelines_enabled", false)
  merge_requests_enabled                           = lookup(each.value, "merge_requests_enabled", true)
  merge_requests_template                          = lookup(each.value, "merge_requests_template", "")
  merge_trains_enabled                             = lookup(each.value, "merge_trains_enabled", false)
  mirror                                           = lookup(each.value, "mirror", false)
  mirror_overwrites_diverged_branches              = lookup(each.value, "mirror_overwrites_diverged_branches", false)
  mirror_trigger_builds                            = lookup(each.value, "mirror_trigger_builds", false)
  only_allow_merge_if_all_discussions_are_resolved = lookup(each.value, "only_allow_merge_if_all_discussions_are_resolved", false)
  only_allow_merge_if_pipeline_succeeds            = lookup(each.value, "only_allow_merge_if_pipeline_succeeds", false)
  only_mirror_protected_branches                   = lookup(each.value, "only_mirror_protected_branches", false)
  packages_enabled                                 = lookup(each.value, "packages_enabled", true)
  pages_access_level                               = lookup(each.value, "pages_access_level", "private")
  path                                             = lookup(each.value, "path", each.value.name) # set name as path
  pipelines_enabled                                = lookup(each.value, "pipelines_enabled", true)
  printing_merge_request_link_enabled              = lookup(each.value, "printing_merge_request_link_enabled", true)
  push_rules                                       = lookup(each.value, "push_rules", [])
  remove_source_branch_after_merge                 = lookup(each.value, "remove_source_branch_after_merge", true)
  request_access_enabled                           = lookup(each.value, "request_access_enabled", true)
  shared_runners_enabled                           = lookup(each.value, "shared_runners_enabled", true)
  snippets_enabled                                 = lookup(each.value, "snippets_enabled", true)
  squash_option                                    = lookup(each.value, "squash_option", "default_off")
  tags                                             = lookup(each.value, "tags", [])
  template_name                                    = lookup(each.value, "template_name", null)
  template_project_id                              = lookup(each.value, "template_project_id", null)
  use_custom_template                              = lookup(each.value, "use_custom_template", null)
  visibility_level                                 = lookup(each.value, "visibility_level", "private")
  wiki_enabled                                     = lookup(each.value, "wiki_enabled", true)

}

resource "gitlab_project_membership" "project_membership" {
  project_id   = "67890"
  user_id      = 1234
  access_level = "guest"
}