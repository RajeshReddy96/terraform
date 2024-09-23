variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z03795423TULP9T7SQZWH"
}

variable "domain_name" {
    default = "rrajesh.online"
}