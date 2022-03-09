output "parent_id" {
    value = gitlab_group.group[0].parent_id
}

output "group_id" {
  value = gitlab_group.group.id
}