resource "aws_s3_bucket" "my-bucket" {
  bucket = "xpix-photos-26w-25013012"

  tags = {
    Name        = "xpix-photos"
  }
}

resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "xpix-photos"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "photo_id"
  stream_enabled = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "photo_id"
    type = "S"
  }

  attribute {
    name = "user_id"
    type = "S"
  }

  attribute {
    name = "uploaded_at"
    type = "S"
  }

  attribute {
    name = "feed_key"
    type = "S"
  }

  global_secondary_index {
    name               = "user-photos-index"
    hash_key           = "user_id"
    range_key          = "uploaded_at"
    projection_type    = "ALL"
  }

  global_secondary_index {
    name               = "feed-index"
    hash_key           = "feed_key"
    range_key          = "uploaded_at"
    projection_type    = "ALL"
  }

  tags = {
    Name        = "my-dynamodb-table"
  }
}

resource "aws_ssm_parameter" "SSM1" {
  name  = "/app/s3/xpix-photos-26w-25013012"
  type  = "String"
  value = var.my-bucket
}

resource "aws_ssm_parameter" "SSM2" {
  name  = "/app/dynamodb/xpix-photos"
  type  = "String"
  value = var.my-dynamodb-table
}
