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

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
