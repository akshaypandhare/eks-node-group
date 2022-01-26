subnet_ids = ["subnet-084660f50eb9fbec1", "subnet-03e21851db757a22f"]
node_group_name = "Assaya-nodes"
scaling_config = [{
    desired_size = "1"
    max_size     = "1"
    min_size     = "1"
  }]
cluster_name = "assaya-poc"
ami_type = "AL2_x86_64"