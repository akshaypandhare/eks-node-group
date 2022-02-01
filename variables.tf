variable "cluster_name" {
  description = "Required"
  type        = string
}

variable "env_name" {
  description = "Required"
  type        = string
}

variable "aws_region" {
  description = "Required"
  type        = string
}

variable "subnet_ids" {
  description = "Required"
  type        = list(string)
}

variable "node_group_name" {
  description = "Required"
  type        = string
}

variable "instance_types" {
  description = "Optional"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "min_size" {
  description = "Optional"
  type        = string
  default     = "1"
}

variable "max_size" {
  description = "Optional"
  type        = string
  default     = "3"
}

variable "desired_size" {
  description = "Optional"
  type        = string
  default     = "2"
}

variable "kubernetes_version" {
  description = "Optional"
  type        = list(string)
  default     = ["1.21"]
}
