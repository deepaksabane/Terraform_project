resource "aws_s3_bucket" "mys3" {
  bucket_prefix = "deepu-forever"  # Use hyphen instead of underscore

  tags = {
    Name        = "deepu_forever"
    Environment = "Dev"
  }
}
# resource "aws_s3_bucket_acl" "mys3" {
#     depends_on = [ 
#         aws_s3_bucket_ownership_controls.mys3,
#         aws_s3_public_access_block.mys3

#      ]te
#      bucket = aws_s3_bucket.mys3.id
#      acl = "public-read"
  
# }