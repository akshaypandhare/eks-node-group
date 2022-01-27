provider "aws" {
    region = "us-west-2"
}

resource "aws_eks_node_group" "this" {
  ami_type = var.ami_type
  capacity_type = var.capacity_type
  cluster_name = var.cluster_name
  disk_size = var.disk_size
  force_update_version = var.force_update_version
  instance_types = var.instance_types
  labels = var.labels
  node_group_name = var.node_group_name
  node_role_arn = aws_iam_role.eks-worker.arn
  release_version = var.release_version
  subnet_ids = var.subnet_ids
  tags = var.tags
  version = var.k8s_version

  dynamic "launch_template" {
    for_each = var.launch_template
    content {
      # id - (optional) is a type of string
      id = launch_template.value["id"]
      # name - (optional) is a type of string
     name = launch_template.value["name"]
      # version - (required) is a type of string
      version = launch_template.value["version"]
    }
  }

  dynamic "remote_access" {
    for_each = var.remote_access
    content {
      # ec2_ssh_key - (optional) is a type of string
      ec2_ssh_key = remote_access.value["ec2_ssh_key"]
      # source_security_group_ids - (optional) is a type of set of string
      source_security_group_ids = remote_access.value["source_security_group_ids"]
    }
  }

  dynamic "scaling_config" {
    for_each = var.scaling_config
    content {
      # desired_size - (required) is a type of number
      desired_size = scaling_config.value["desired_size"]
      # max_size - (required) is a type of number
      max_size = scaling_config.value["max_size"]
      # min_size - (required) is a type of number
      min_size = scaling_config.value["min_size"]
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      # create - (optional) is a type of string
      create = timeouts.value["create"]
      # delete - (optional) is a type of string
      delete = timeouts.value["delete"]
      # update - (optional) is a type of string
      update = timeouts.value["update"]
    }
  }

}


## IAM role and policies for NODE group.

resource "aws_iam_role" "eks-worker" {
  name = "node-eks-worker"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "eks-worker-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_role_policy_attachment" "eks-worker-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_role_policy_attachment" "eks-worker-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-worker.name
}

resource "aws_iam_instance_profile" "eks-worker" {
  name = "node-eks-worker"
  role = aws_iam_role.eks-worker.name
}
