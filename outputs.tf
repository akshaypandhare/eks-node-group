output "eks_node_group_role_arn" {
  description = "ARN of the worker nodes IAM role"
  value       = module.eks_node_group.eks_node_group_role_arn
}

output "eks_node_group_role_name" {
  description = "Name of the worker nodes IAM role"
  value       = module.eks_node_group.eks_node_group_role_name
}

output "eks_node_group_id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon"
  value       = module.eks_node_group.eks_node_group_id
}

output "eks_node_group_arn" {
  description = "Amazon Resource Name (ARN) of the EKS Node Group"
  value       = module.eks_node_group.eks_node_group_arn
}

output "eks_node_group_resources" {
  description = "List of objects containing information about underlying resources of the EKS Node Group"
  value       = module.eks_node_group.eks_node_group_resources
}

output "eks_node_group_status" {
  description = "Status of the EKS Node Group"
  value       = module.eks_node_group.eks_node_group_status
}

output "eks_node_group_remote_access_security_group_id" {
  description = "The ID of the security group generated to allow SSH access to the nodes, if this module generated one"
  value       = module.eks_node_group.eks_node_group_remote_access_security_group_id
}

output "eks_node_group_cbd_pet_name" {
  description = "The pet name of this node group, if this module generated one"
  value       = module.eks_node_group.eks_node_group_cbd_pet_name
}
