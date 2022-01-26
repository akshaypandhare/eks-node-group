variable "ami_type" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "capacity_type" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "(required)"
  type        = string
}

variable "disk_size" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "force_update_version" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "instance_types" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

variable "labels" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "node_group_name" {
  description = "(required)"
  type        = string
}

#variable "node_role_arn" {
#  description = "(required)"
#  type        = string
#}

variable "release_version" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "(required)"
  type        = set(string)
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "k8s_version" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "launch_template" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      id      = string
      name    = string
      version = string
    }
  ))
  default = []
}

variable "remote_access" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      ec2_ssh_key               = string
      source_security_group_ids = set(string)
    }
  ))
  default = []
}

variable "scaling_config" {
  description = "nested block: NestingList, min items: 1, max items: 1"
  type = set(object(
    {
      desired_size = number
      max_size     = number
      min_size     = number
    }
  ))
}

variable "timeouts" {
  description = "nested block: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      update = string
    }
  ))
  default = []
}