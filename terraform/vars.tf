variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "PATH_TO_PRIVATE_KEY" {}
variable "PATH_TO_PUBLIC_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
  }
}
variable "INSTANCE_NAME" {
    default = "dotnetcoreapp"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
