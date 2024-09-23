resource "aws_instance" "terraform" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = var.instance_names[count.index]
  }
  # tags = merge(
  #     var.common_tags,
  #     {
  #         Name = var.instance_names[count.index]   
  #     }
  # )
}
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh" # allow_ssh is already there in my account
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
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-sshh"
  }
}
