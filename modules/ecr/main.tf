resource "aws_ecr_repository" "appointment" {
  name = "appointment-service"

  tags = {
    Name = "appointment-service"
  }
}

resource "aws_ecr_repository" "patient" {
  name = "patient-service"

  tags = {
    Name = "patient-service"
  }
}


