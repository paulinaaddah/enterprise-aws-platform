variable "aws_region" {

  description = "AWS region where resources will be deployed."

  type = string

}

variable "project_name" {

  description = "Name of the project."

  type = string

}

variable "environment" {

  description = "Deployment environment."

  type = string

}

variable "owner" {

  description = "Project owner."

  type = string

}

variable "cost_center" {

  description = "Business cost center."

  type = string

}