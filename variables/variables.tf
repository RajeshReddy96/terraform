#  1st cli -->terraform plan -var="instance_type=t3.large"
#  2nd terraform.tfvars
#  3rd environment variables   ---> export TF_VAR_instance_type=t3.xlarge  (TF_VAR_yout_variable_name)
#  4th default
#  5th prompt

variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is the AMI ID of devops-practice which is RHEL-9"
}

variable "instance_type" {
    type = string
    #default = "t3.micro"
}

variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name" {
    default = "allow_sshh"
}

variable "sg_description" {
    default = "Allow port number 22 for ssh access"
}

variable "from_port" {
    default = 22
    type = number
}

variable "to_port" {
    default = 22
    type = number
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}