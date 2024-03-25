output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "azs" {
  value = module.vpc.azs
}

output "aws_region" {
  value = local.aws_region
}

output "subnet_ids" {
  #value = module.vpc.private_subnets
  value =  join(",", concat(module.vpc.public_subnets, module.vpc.private_subnets))
}
