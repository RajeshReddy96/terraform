resource "aws_instance" "terraform" {

    ami = data.aws_ami.rajesh.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
   }
}
resource "aws_security_group" "allow_ssh_terraform" {
    name        = "allow_sshh"  # allow_ssh is already there in my account
    description = "Allow Port no 22 for ssh access"
     
     #usually will allow everything in egress what protol or ip address(we are not checking)
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
   }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]  #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
   }

   tags = {
    Name = "allow_sshh"
  }
 }

