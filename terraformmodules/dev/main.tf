provider "aws" {
    region = "us-east-1"
    access_key = "AKIASRLKWHCZGDJ2AXPM"
    secret_key = "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"
  
}

module "vpc" {
    source = "../MODULES/vpc module"
    ipadress = "10.20.0.0/16"
    vpc-name = "vpc5"
    sub_ip="10.20.1.0/24"
    sub-name="subnet5"
}

module "igw" {
    source = "../MODULES/igw module"
    vpc-id = module.vpc.vpc_id
    igw-name = "awsigw"
  
}

module "rt" {
    source = "../MODULES/route table module"
    vpc-id = module.vpc.vpc_id
    gateway-id = module.igw.igw_id
    rt-name = "route table"
    ipadress = "0.0.0.0/0"
    sub_id = module.vpc.sub_id

}


module "sg" {
    source = "../MODULES/sg module"
    sg-name = "sg1"
    vpc-id = module.vpc.vpc_id
  
}


module "ec2instance" {
    source = "../MODULES/ec2 module"
    instance-type = "t2.micro"
    ami-id = "ami-084568db4383264d4"
    key-name = "raju"
    sub-id = module.vpc.sub_id
    

  
}
