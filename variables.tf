variable "allow_all" {
   type = string
   default = "sg-088bbd993cbc52b59"
}
variable "zone_id" {
    default = "Z012785114HGZTDQ8KSQH"
}
variable "domain_name" {
  default = "lithesh.shop"
}
variable "instances" {
    type     = map
    default = {
        mysql     = "t3.micro"
        backend   = "t3.micro"
        frontend  = "t3.micro"
    }
}

# variable "frontend_instance" {
#    default = {
#         instance_type  = "t2.micro"
#    }
# }
# variable "backend_instance" {
#    default = {
#         instance_type  = "t2.micro"
#    }
# }
# variable "mysql_instance" {
#    default = {
#         instance_type  = "t2.small"
#    }
# }

