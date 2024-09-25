resource "aws_s3_bucket" "buckets" {
  for_each = var.bucket_names
  bucket = each.value
  tags = var.bucket_tags[each.key]
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  for_each = aws_s3_bucket.buckets
  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}