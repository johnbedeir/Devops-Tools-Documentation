resource "aws_ecr_repository" "ecr_repo" {
  name = "nodejs-app"
  image_scanning_configuration {
    scan_on_push = true
  }
}
