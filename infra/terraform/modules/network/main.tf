#-----VPC-----
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}
# #-----Subnets-----
# resource "aws_subnet" "subnet_pub" {
#   vpc_id                  = var.vpc_id
#   cidr_block              = var.subnet_pub_cidr
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.available.names[0]

#   tags = {
#     Name = var.subnet_pub_name
#   }

# }
# resource "aws_subnet" "subnet_pub_b" {
#   vpc_id                  = var.vpc_id
#   cidr_block              = var.subnet_pub_b_cidr
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.available.names[1]

#   tags = {
#     Name = var.subnet_pub_b_name
#   }

# }

# resource "aws_subnet" "subnet_prv" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = var.subnet_prv_cidr
#   map_public_ip_on_launch = false
#   availability_zone       = data.aws_availability_zones.available.names[0]

#   tags = {
#     Name = var.subnet_prv_name
#   }

# }

# resource "aws_subnet" "subnet_prv_b" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = var.subnet_prv_b_cidr
#   map_public_ip_on_launch = false
#   availability_zone       = data.aws_availability_zones.available.names[1]

#   tags = {
#     Name = var.subnet_prv_b_name
#   }

# }

# #-----EIP-----
# resource "aws_eip" "nat_eip" {
# }

# #-----IGW-----
# resource "aws_internet_gateway" "igw" {
#   vpc_id = var.vpc_id

#   tags = {
#     Name = var.igw_name
#   }

# }

# #-----NAT-----
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = var.subnet_pub_id

#   tags = {
#     Name = var.nat_name
#   }

# }

# #-----Route Table-----
# #Public
# resource "aws_route_table" "pub_rtb" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = var.igw_id
#   }

#   tags = {
#     Name = var.rtb_pub_name
#   }
# }


# resource "aws_route_table" "prv_rtb" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }
#   tags = {
#     Name = var.rtb_prv_name
#   }
# }
# #-----Route Table Association-----
# resource "aws_route_table_association" "rtb_asso_pub" {
#   subnet_id      = aws_subnet.subnet_pub.id
#   route_table_id = aws_route_table.pub_rtb.id
# }

# resource "aws_route_table_association" "rtb_asso_pub_b" {
#   subnet_id      = aws_subnet.subnet_pub_b.id
#   route_table_id = aws_route_table.pub_rtb.id
# }

# resource "aws_route_table_association" "rtb_asso_prv" {
#   subnet_id      = aws_subnet.subnet_prv.id
#   route_table_id = aws_route_table.prv_rtb.id
# }

# resource "aws_route_table_association" "rtb_asso_prv_b" {
#   subnet_id      = aws_subnet.subnet_prv_b.id
#   route_table_id = aws_route_table.prv_rtb.id
# }