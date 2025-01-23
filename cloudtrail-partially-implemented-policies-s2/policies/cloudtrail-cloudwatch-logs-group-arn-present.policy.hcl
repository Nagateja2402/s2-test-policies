sentinel {
  consumer = terraform
  enforcement_level = advisory
}

resource_policy "aws_cloudtrail" "cloudtrail_resources" {
  locals {
    cloudwatch_logs_groups_arn = try(
      policy.aws_cloudwatch_log_group.arn == self.cloud_watch_log_group_arn
    )
  }
  enforce {
    condition = attrs != null && (core::try(attrs.cloud_watch_logs_group_arn, "") != "" || local.cloudwatch_logs_groups_arn != "")
    error_message = "Attribute 'cloud_watch_logs_group_arn' must be present for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-5 for more details."
  }
}
