resource "aws_security_group" "allow_ssh_terraform" {
    name        = "dynamic_block"  # allow_ssh is already there in my account
    description = "Allow Port no 22 for ssh access"
     
     #usually will allow everything in egress what protol or ip address(we are not checking)
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"]
   }
    # terraform will give us a variable with block name 
    # in variable ingress rules each block has 1 value here we refered as one block values
    # we can give values as [] or .  
    dynamic "ingress" {
        for_each = var.ingress_rules
        content{
            from_port        = ingress.value["from_port"]
            to_port          = ingress.value["to_port"]
            protocol         = ingress.value.protocol
            cidr_blocks      = ingress.value.cidr_blocks

        }
   }

   tags = {
    Name = "allow_sshh"
  }
 }

# resource "aws_instance" "terraform" {

#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
#     tags = {
#     Name = "terraform"
#    }
# }