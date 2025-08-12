
variable "vpc_security_group_ids"{
    default= ["sg-0c433bcccf94c7d36"]
}

variable "instances"{
    default = {
        frontend={
            ami_id = "ami-09c813fb71547fc4f"
            instance_type = "t3.small"
        }
        catalogue = {
            ami_id = "ami-09c813fb71547fc4f"
            instance_type = "t3.small"
        }
        mongodb = {
            ami_id = "ami-09c813fb71547fc4f"
            instance_type = "t3.small"
        }
}
}

variable "zone_id"{
    default="Z08573782K96CIOPZ7P6V"
}

variable "env"{
    default="dev"
}