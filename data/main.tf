provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudtrail" "name" {
  name                          = "new_cloudtrail_resource"
  s3_bucket_name                = "test-bucket"
  enable_log_file_validation    = true
  is_multi_region_trail         = true
  include_global_service_events = true
  cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.cloudtrail_log_group.arn

  tags = {
    Name = "test-trail"
  }
}

resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name              = "/aws/cloudtrail/my_cloudtrail_logs"
  retention_in_days = 90
}
