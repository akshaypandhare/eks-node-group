module "node_group" {
  source       = "../"
  cluster_name = "testing-module"
  node_group_name = "node-group"
  env_name     = "dev"
  aws_region   = "us-west-2"
  subnet_ids   = ["subnet-07a112b4bec0b8526", "subnet-019ad8f9ed243c0b7"]
}
