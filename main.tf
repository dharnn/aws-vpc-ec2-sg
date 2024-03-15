module "vpc" {
  source = "./modules/vpc"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id
}
