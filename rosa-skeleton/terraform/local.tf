locals {
  cluster_name = "rosa-test"
  aws_region   = "ap-northeast-1"

  vpc = {
    name = "${local.cluster_name}-vpc"
    cidr = "10.0.0.0/16"

    public_subnets = [
      "10.0.1.0/24",
      "10.0.2.0/24",
      "10.0.3.0/24",
    ]

    private_subnets = [
      "10.0.4.0/24",
      "10.0.5.0/24",
      "10.0.6.0/24",
    ]

    tags = {
      Terraform    = "true"
      service      = "ROSA"
      cluster_name = local.cluster_name
    }
  }

  subnet_ids_temp = concat([for item in concat(module.vpc.public_subnets, module.vpc.private_subnets) : format("\"%s\"", item)])
  subnet_ids      = join(",", local.subnet_ids_temp)
}
