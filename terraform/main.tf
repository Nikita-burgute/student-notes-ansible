terraform {
  required_version = ">= 1.0"
}

resource "terraform_data" "student_notes_infrastructure" {
  input = {
    project     = "Student Notes Sharing Website"
    environment = "Development"
    server      = "EC2 instance - t2.micro (planned design)"
    region      = "ap-south-1"
  }
}

output "infrastructure_details" {
  value = terraform_data.student_notes_infrastructure.output
}