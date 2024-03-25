locals {
  project    = "${{ values.cluster_name }}"
  aws_region = "${{ values.aws_region }}"

  vpc = {
    name = "${{ values.cluster_name }}-vpc"
    cidr = "${{ values.vpc_cidr }}"

    public_subnets = [
      "${{ values.public_subnet_1 }}",
      "${{ values.public_subnet_2 }}",
      "${{ values.public_subnet_3 }}",
    ]

    private_subnets = [
      "${{ values.private_subnet_1 }}",
      "${{ values.private_subnet_2 }}",
      "${{ values.private_subnet_3 }}",
    ]

    tags = {
      Terraform    = "true"
      service      = "ROSA"
      cluster_name = "${{ values.cluster_name }}"
    }
  }
}
