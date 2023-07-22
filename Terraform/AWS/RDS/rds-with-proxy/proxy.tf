# Create a Proxy for the RDS
resource "aws_db_proxy" "rds_proxy" {
  name                   = "${aws_rds_cluster.rds_cluster.cluster_identifier}-proxy"
  debug_logging          = false
  engine_family          = "MYSQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = aws_iam_role.proxy_role.arn
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  vpc_subnet_ids         = [aws_subnet.rds_subnet_a.id, aws_subnet.rds_subnet_b.id]

  auth {
    auth_scheme = "SECRETS"
    description = "RDS proxy auth for ${aws_rds_cluster.rds_cluster.cluster_identifier}"
    iam_auth    = "DISABLED"
    secret_arn  = aws_secretsmanager_secret_version.rds_credentials_version.arn
  }

  tags = {
    Name = "${aws_rds_cluster.rds_cluster.cluster_identifier}-proxy"
  }
}

#Proxy Target group
resource "aws_db_proxy_default_target_group" "proxy_target_group" {
  db_proxy_name = aws_db_proxy.rds_proxy.name
}

#Proxy Target
resource "aws_db_proxy_target" "test_proxy_target" {
  db_proxy_name         = aws_db_proxy.rds_proxy.name
  target_group_name     = aws_db_proxy_default_target_group.proxy_target_group.name
  db_cluster_identifier = aws_rds_cluster.rds_cluster.id
}

resource "aws_iam_role" "proxy_role" {
  name = "${aws_rds_cluster.rds_cluster.cluster_identifier}-proxy-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "rds.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "proxy_policy" {
  name = "${aws_rds_cluster.rds_cluster.cluster_identifier}-proxy-policy"
  role = aws_iam_role.proxy_role.id

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "rds-db:*",
			"Effect": "Allow",
			"Resource": "*"
		},
		{
			"Sid": "GetSecretValue",
			"Action": [
				"secretsmanager:GetSecretValue"
			],
			"Effect": "Allow",
			"Resource": [
				"*"
			]
		},
		{
			"Sid": "DecryptSecretValue",
			"Action": [
				"kms:Decrypt"
			],
			"Effect": "Allow",
			"Resource": [
				"*"
			],
			"Condition": {
				"StringEquals": {
					"kms:ViaService": "secretsmanager.eu-central-1.amazonaws.com"
				}
			}
		}
	]
}
EOF
}
