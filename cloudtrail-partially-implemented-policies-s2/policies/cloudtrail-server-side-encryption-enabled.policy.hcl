sentinel {
  consumer = terraform
  enforcement_level = advisory
}

resource_policy "aws_cloudtrail" "cloudtrail_resources" { 
  enforce {
    condition = attrs.kms_key_id != ""
    error_message = "Attribute 'kms_key_id' must be present for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2 for more details."
  }
}
