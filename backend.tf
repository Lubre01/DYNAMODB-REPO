terraform {
  backend "s3" {
    bucket         = "splunkwk7s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}



resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "my-terraform-state-lock-dynamodb"  # Replace with your preferred table name
  billing_mode   = "PAY_PER_REQUEST"  # You can change this to "PROVISIONED" if needed
  hash_key       = "LockID"          # Replace with your preferred hash key attribute name
  attribute {
    name = "LockID"
    type = "S"  # Use "S" for string or "N" for number, depending on your use case
  }
  
}

 