provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"

  s3_use_path_style           = true

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "site" {
  bucket = "prince-static-site"
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"

etag = filemd5("index.html")
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
}
