sentinel {
    consumer = terraform
}

resource "aws_cloudtrail" "resource1" {
    expect_failure = false
    attrs = {
        cloud_watch_logs_group_arn = "arn:aws:logs:us-west-2:123456789012:log-group:my-log-group"
    }
    meta = {}
}

resource "aws_cloudtrail" "resource2" {
    expect_failure = true
    attrs = {
        cloud_watch_logs_group_arn = ""
    }
    meta = {}
}
