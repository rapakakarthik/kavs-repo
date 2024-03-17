resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
      
      Name= "kavya_vpc"
    }
  
}

resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id

    tags = {
      Name = "kavya_igw"
    }
  
}

resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
      Name = "kavya_subnet1"

      vpc_id = aws_vpc.dev.id
      cidr_block = "10.0.2.0/24"
      map_public_ip_on_launch = true
      availability_zone = "us-east-1b"
      

      tags = {
        Name = "kavya_subnet2"
      }
    }
}

resource "aws_route_table" "dev" {
 vpc_id = aws_vpc.dev.id
 route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
    
     }

 tags = {
   Name = "kavya_rt"
 }

}