# IAM Role and Policy for Lambda
resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_vpc_execution" {
  name = "lambda_vpc_execution"
  role = aws_iam_role.lambda_execution_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "rds-db:*"
        ],
        Effect   = "Allow",
        Resource = "${aws_db_proxy.rds_proxy.arn}:*"
      }
    ]
  })
}


# Security Group for Lambda
resource "aws_security_group" "lambda_sg" {
  name        = "lambda_sg"
  description = "Allow outbound traffic for MYSQL/AURORA on port 3306"

  vpc_id = aws_vpc.rds_vpc.id

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lambda_sg"
  }
}

# Lambda Layer for node_modules
resource "aws_lambda_layer_version" "node_modules" {
  filename            = "nodejs/node_modules.zip"
  layer_name          = "node_modules_layer"
  compatible_runtimes = ["nodejs18.x"] # assuming your function will be in Node.js 14.x runtime

  source_code_hash = filebase64sha256("nodejs/node_modules.zip")
}

# Lambda function
resource "aws_lambda_function" "my_lambda" {
  filename      = "nodejs/my_lambda_function.zip"
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x" # Change this to your desired Node.js runtime version
  timeout       = 120

  # Associate the Lambda Layer to the Lambda Function
  layers = [aws_lambda_layer_version.node_modules.arn]

  # Ensure Lambda function updates when the zip file changes
  source_code_hash = filebase64sha256("nodejs/my_lambda_function.zip")

  # VPC configurations for Lambda using the existing VPC and subnet(s)
  vpc_config {
    subnet_ids         = aws_db_subnet_group.rds_subnet_group.subnet_ids
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  environment {
    variables = {
      NODE_PATH = "/opt/node_modules"
    }
  }
}
