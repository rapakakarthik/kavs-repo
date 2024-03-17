resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
      
      Name= "kavya_vpc"
    }
  
}