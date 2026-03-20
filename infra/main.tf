terraform {
    required_version = ">= 1.14.0"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
}

provider "aws" {
    region = var.aws_region
}

import {
  id = "us-east-1_XEQO4sVpp"
  to = aws_cognito_user_pool.xpix
}

import {
  id = "us-east-1_XEQO4sVpp/4q2ob774dgjg96ji8j1g724d4k"
  to = aws_cognito_user_pool_client.xpix
}

output "web_server_public_ip" {
  value = aws_instance.xpix-app-server.public_ip
}
