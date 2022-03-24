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
| [gitlab_group.group](https://registry.terraform.io/providers/gitlabhq/gitlab/3.11.1/docs/resources/group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | Map for list of groups | <pre>map(object({<br>    name                              = string<br>    path                              = string<br>    auto_devops_enabled               = optional(bool)<br>    default_branch_protection         = optional(number)<br>    description                       = optional(string)<br>    emails_disabled                   = optional(bool)<br>    lfs_enabled                       = optional(bool)<br>    mentions_disabled                 = optional(bool)<br>    parent_id                         = number<br>    project_creation_level            = optional(string)<br>    request_access_enabled            = optional(bool)<br>    require_two_factor_authentication = optional(bool)<br>    share_with_group_lock             = optional(bool)<br>    subgroup_creation_level           = optional(string)<br>    two_factor_grace_period           = optional(number)<br>    visibility_level                  = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | Parent group id | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_groups"></a> [created\_groups](#output\_created\_groups) | List of created groups with module |
<!-- END_TF_DOCS -->