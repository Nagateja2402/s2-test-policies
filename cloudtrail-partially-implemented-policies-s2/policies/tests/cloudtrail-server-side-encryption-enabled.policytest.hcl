sentinel {
    consumer = terraform
}

resource "cloudtrail" "resource1" {
    expect_failure = false
    attrs = {
        kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
    }
    meta = {}
}

resource "cloudtrail" "resource2" {
    expect_failure = true
    attrs = {
        kms_key_id = ""
    }
    meta = {}
}
