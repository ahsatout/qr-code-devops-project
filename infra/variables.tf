variable "bucket_names" {
  type = map(string)
  default = {
    "QR"      = "qr-code-asatout"
    "BACKEND" = "state-lock-asatout"
  }
}

variable "bucket_tags" {
  type = map(map(string))
  default = {
    "QR" = {
      Name        = "QRs BUCKET"
      Environment = "Dev"
    }
    "BACKEND" = {
      Name        = "STATE LOCK BUCKET"
      Environment = "Prod"
    }
  }
}

variable "table" {
  type    = string
  default = "state-lock"
}