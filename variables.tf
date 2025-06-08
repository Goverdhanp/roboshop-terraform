variable "ami_id"{
    default="ami-09c813fb71547fc4f"
}

variable "instance_type"{
    default="t3.small"
}

variable "vpc_security_group_ids"{
    default= ["sg-0c433bcccf94c7d36"]
}

variable "instances"{
    default= [
        catalogue=null,
        mongodb=null,
        frontend=null

    ]
}

variable "zone_id"{
    default="Z08573782K96CIOPZ7P6V"
}

variable "env"{
    default="dev"
}