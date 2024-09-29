provider aws{
    region = "us-east-1"
}

terraform {
  
backend "s3" {

    bucket = "netflixproject1"
    key = "irfanJenkins/terraform.tfstate"
    region = "us-east-1"

}
}

resource "aws_instance" "example" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"
    subnet_id = "subnet-086141a787c023715"
  
}
