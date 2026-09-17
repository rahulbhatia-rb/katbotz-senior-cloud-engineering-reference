terraform { required_version = ">= 1.6.0" }
variable "name" { type = string }
variable "tags" { type = map(string) }

resource "aws_s3_bucket" "evidence" { bucket_prefix = "${var.name}-evidence-" tags = var.tags }
resource "aws_s3_bucket_public_access_block" "evidence" {
  bucket = aws_s3_bucket.evidence.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "evidence" {
  bucket = aws_s3_bucket.evidence.id
  rule { apply_server_side_encryption_by_default { sse_algorithm = "aws:kms" } }
}
resource "aws_security_group" "workload" {
  name_prefix = "${var.name}-workload-"
  egress { from_port = 443 to_port = 443 protocol = "tcp" cidr_blocks = ["0.0.0.0/0"] }
  tags = var.tags
}
