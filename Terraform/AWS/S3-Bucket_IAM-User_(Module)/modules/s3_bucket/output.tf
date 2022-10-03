output "s3_bucket_id" {
    value = aws_s3_bucket.s3.id
    description = "The S3 Bucket Name"
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.s3.arn
    description = "The S3 Bucket ARN"
}