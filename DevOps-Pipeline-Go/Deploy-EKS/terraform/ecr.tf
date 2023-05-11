resource "aws_ecr_repository" "ecr_repo" {
  name = "goapp-survey"
  image_scanning_configuration {
    scan_on_push = true
  }
}
