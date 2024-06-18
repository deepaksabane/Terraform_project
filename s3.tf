resource "aws_s3_bucket" "mys3" {
  bucket_prefix = "deepu_forever"

  tags = {
    Name        = "deepu_forever"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
    depends_on = [ 
        aws_s3_bucket_ownership_controls.example,
        aws_s3_public_access_block.example

     ]
     bucket = aws_s3_bucket.portfolio_bucket.id
     acl = "public-read"
  
}