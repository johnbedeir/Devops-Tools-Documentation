resource "aws_s3_bucket" "s3" {
  bucket = var.BUCKETNAME

  tags = {
    Name = var.BUCKETNAME
  }
}

resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}

resource "aws_iam_user" "k10-user" {
  name = var.user
  path = "/system/"

  tags = {
    tag-key = var.user
  }
}

resource "aws_iam_access_key" "k10-user" {
  user = aws_iam_user.k10-user.name
}

resource "aws_iam_user_policy" "k10-user_policy" {
  name = var.user_policy
  user = aws_iam_user.k10-user.name

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListStorageLensConfigurations",
                "s3:ListAccessPointsForObjectLambda",
                "s3:GetAccessPoint",
                "s3:PutAccountPublicAccessBlock",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:ListAccessPoints",
                "s3:PutAccessPointPublicAccessBlock",
                "s3:ListJobs",
                "s3:PutStorageLensConfiguration",
                "s3:ListMultiRegionAccessPoints",
                "s3:CreateJob"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::k10-buckup"
        }
    ]
  })
}