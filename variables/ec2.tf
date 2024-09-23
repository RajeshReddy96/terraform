resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    # in vpc aws_security_group.allow_ssh_terraform.id  both unteakkda oka ip address create avutundi
    # adi .id so appudu insance create avutundi see 1st securit create avutae ne kada instance create chestav
    # so security create ayyaka nuvu instance create chesatv by help of security ssh
    tags = var.tags
}
resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name
    description = var.sg_description
     
     #usually will allow everything in egress what protol or ip address(we are not checking)
     #block
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
   }

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.ingress_cidr #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
   }

   tags = var.tags
}

