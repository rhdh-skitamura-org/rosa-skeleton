data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = local.vpc.name
  cidr                 = local.vpc.cidr
  enable_dns_hostnames = true

  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2],
  ]

  public_subnets  = local.vpc.public_subnets
  private_subnets = local.vpc.private_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  tags = local.vpc.tags
}

resource "local_file" "subnet_ids" {
  content  = join(",", concat(module.vpc.public_subnets, module.vpc.private_subnets))
  filename = "/workspace/shared/subnet_ids"
}
