resource "aws_kms_key" "terraform_state" {

  description             = "KMS key for encrypting Terraform state"

  deletion_window_in_days = 7

  enable_key_rotation     = true

  tags = {

    Name = "${var.project_name}-kms"

  }

}