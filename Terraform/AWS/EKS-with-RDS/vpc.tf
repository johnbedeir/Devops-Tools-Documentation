module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${local.cluster_name}-vpc"
  cidr = var.main_network_block
  azs  = data.aws_availability_zones.available.names

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway           = true
  single_nat_gateway           = true
  one_nat_gateway_per_az       = false
  create_database_subnet_group = false
  enable_dns_support           = true
  enable_dns_hostnames         = true
  reuse_nat_ips                = true
  external_nat_ip_ids          = [aws_eip.nat_gw_elastic_ip.id]

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}
