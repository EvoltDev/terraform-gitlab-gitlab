#output "parent_id" {
#    value = gitlab_group.group["group_1"].parent_id
#}

#output "group_id" {
#  value = gitlab_group.group.id
#}

output "created_groups" {
  value = gitlab_group.group
}