resource "aws_vpc" "main" {
    cidr_block = "192.168.0.0/16"

    tags = {
        Name = "assignment3-vpc"
    }
}

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.0.0/20"

    tags = {
        Name = "assignment3-subnet-public1-us-east-1a"
    }
}

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.16.0/20"

    tags = {
        Name = "assignment3-subnet-public2-us-east-1b"
    }
}

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.128.0/20"

    tags = {
        Name = "assignment3-subnet-private1-us-east-1a"
    }
}

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.144.0/20"

    tags = {
        Name = "assignment3-subnet-private2-us-east-1b"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "assignment3-igw"
    }
}

resource "aws_route_table" "private1" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "assignment3-rtb-private1-us-east-1a"
    }
}

resource "aws_route_table" "private2" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "assignment3-rtb-private2-us-east-1b"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "assignment3-rtb-public"
    }
}

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.private2.id
}

resource "aws_security_group" "xpix-app-server" {
    name = "xpix-app-server"
    description = "allow XPix app server connections"
    vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "rule1" {
    security_group_id = aws_security_group.xpix-app-server.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

import {
    id = "vpc-0ab842fd2bb4b2572"
    to = aws_vpc.main
}

import {
    id = "subnet-06b803e6c35fef383"
    to = aws_subnet.public1
}

import {
  id = "subnet-0807e03cde30d05f1"
  to = aws_subnet.public2
}

import {
    id = "subnet-0d72dd90f052d31cb"
    to = aws_subnet.private1
}

import {
  id = "subnet-011ee90304e82a11a"
  to = aws_subnet.private2
}

import {
  id = "igw-06edf109b3cad212c"
  to = aws_internet_gateway.igw
}

import {
  id = "rtb-0b0c16851f04ffb69"
  to = aws_route_table.private1
}

import {
  id = "rtb-0a089e81a0adfaafe"
  to = aws_route_table.private2
}

import {
    id = "rtb-03cc1c8fb6f6858ee"
    to = aws_route_table.public
}

import {
  id = "subnet-06b803e6c35fef383/rtb-03cc1c8fb6f6858ee"
  to = aws_route_table_association.public1
}

import {
    id = "subnet-0807e03cde30d05f1/rtb-03cc1c8fb6f6858ee"
    to = aws_route_table_association.public2
}

import {
  id = "subnet-0d72dd90f052d31cb/rtb-0b0c16851f04ffb69"
  to = aws_route_table_association.private1
}

import {
  id = "subnet-011ee90304e82a11a/rtb-0a089e81a0adfaafe"
  to = aws_route_table_association.private2
}

import {
  id = "sg-073bdbc7cb2ecad9c"
  to = aws_security_group.xpix-app-server
}

import {
  id = "sgr-08b5e5d21bfd61a74"
  to = aws_vpc_security_group_ingress_rule.rule1
}
