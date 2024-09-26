resource "aws_s3_bucket" "buckets" {
  for_each = var.bucket_names
  bucket   = each.value
  tags     = var.bucket_tags[each.key]
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  for_each = aws_s3_bucket.buckets
  bucket   = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.buckets["QR"].id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.buckets["QR"].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_public_access_block.public_access,
    aws_s3_bucket_ownership_controls.ownership_controls,
  ]

  bucket = aws_s3_bucket.buckets["QR"].id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.buckets["QR"].id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.buckets["QR"].arn}/*"
      },
    ]
  })
}