sentinel {
  consumer = terraform
  enforcement_level = advisory

  plugins {
    string = {
        source = "../../plugins/string"
    }
  }
}

resource_policy "aws_cloudtrail" "cloudtrail_resources" { 
  enforce {
    condition = plugin::string::isempty(attrs.cloud_watch_logs_group_arn)
    error_message = "Attribute 'cloud_watch_logs_group_arn' must be present for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-5 for more details."
  }
}
