What you have in your vpc.tf:
VPC with CIDR 10.0.0.0/16

2 public subnets in different AZs, public IP mapping enabled

2 private subnets in different AZs

Internet Gateway attached to VPC

Public route table routing 0.0.0.0/0 → Internet Gateway

Public subnet associations with the public route table

Elastic IPs allocated for NAT Gateways (one per public subnet, good for HA)

NAT Gateway created in the first public subnet (aws_subnet.public_subnets[0])

Private route table routing 0.0.0.0/0 → NAT Gateway

Private subnet associations with the private route table

Zc5p7DCQ5uMeEcjn