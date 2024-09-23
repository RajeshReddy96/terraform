variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "using count function from index 0 to 3 it will take"
}

variable "domain_name" {
  default = "rrajesh.online"
}

variable "zone_id" {
  default = "Z03795423TULP9T7SQZWH"
}