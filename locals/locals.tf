locals {
    domain_name = "rrajseh.online"
    zone_id = "Z03795423TULP9T7SQZWH"
    # count.index will not work in locals
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}