variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region in which the EC2 instance will run"
}

variable "ami_map" {
  type        = map(string)
  description = "Map of AMIs and their regions"
  default = {
    "us-east-1" = "ami-09d95fab7fff3776c"
  }
}
