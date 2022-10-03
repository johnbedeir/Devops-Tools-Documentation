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
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Action: "s3:*",
        Resource: "arn:aws:s3:::${var.BUCKETNAME}/*"
      }
    ]
  })
}