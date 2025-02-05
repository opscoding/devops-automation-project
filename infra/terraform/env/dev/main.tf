# Provider configuration for the dev environment (using the same AWS provider here)
provider "aws" {
  region = "us-east-1"

}

# Include common modules (like networking, compute, etc.)
module "network" {
  source = "../../modules/network"

  vpc_cidr = "172.16.0.0/16"
  vpc_name = "devops-automation-vpc"
  vpc_id   = module.network.vpc_id

  # subnet_pub_name = "devops-automation-sbn-pub-2a"
  # subnet_pub_cidr = "172.16.0.0/18"
  # subnet_pub_id   = module.network.subnet_pub_id

  # subnet_pub_b_name = "devops-automation-sbn-pub-2b"
  # subnet_pub_b_cidr = "172.16.64.0/18"
  # subnet_pub_b_id   = module.network.subnet_pub_b_id

  # subnet_prv_cidr = "172.16.128.0/18"
  # subnet_prv_name = "devops-automation-sbn-prv-2a"

  # subnet_prv_b_cidr = "172.16.192.0/18"
  # subnet_prv_b_name = "devops-automation-sbn-prv-2b"

  # igw_name = "devops-automation-igw"
  # igw_id   = module.network.igw_id

  # nat_name = "devops-automation-nat"
  # nat_id   = module.network.nat_id

  # rtb_pub_name = "devops-automation-rtb-pub"
  # rtb_pub_id   = module.network.rtb_pub_id

  # rtb_prv_name = "devops-automation-rtb-prv"
}
