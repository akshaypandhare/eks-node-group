provider "aws" {
  region = var.aws_region
}

module "label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  name       = var.node_group_name
  stage      = var.env_name
  delimiter  = "-"
}

module "eks_node_group" {
  source  = "cloudposse/eks-node-group/aws"
  version = "0.27.2"

  instance_types        = var.instance_types
  subnet_ids            = var.subnet_ids
  min_size              = var.min_size
  max_size              = var.max_size
  desired_size          = var.desired_size
  cluster_name          = var.cluster_name
  create_before_destroy = true
  kubernetes_version    = var.kubernetes_version

  # Enable the Kubernetes cluster auto-scaler to find the auto-scaling group
  cluster_autoscaler_enabled = true

  context = module.label.context

  # Ensure the cluster is fully created before trying to add the node group
  #module_depends_on = [module.eks_cluster.kubernetes_config_map_id]
}
