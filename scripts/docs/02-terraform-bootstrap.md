# Phase 2: Terraform Bootstrap Configuration

## Overview

This phase establishes the Terraform project configuration that will be used throughout the Enterprise AWS Platform project.

Before any AWS resources are provisioned, Terraform itself must be configured to ensure consistency, maintainability, and compliance with enterprise Infrastructure as Code (IaC) standards.

At the end of this phase, the project contains a fully initialized and validated Terraform configuration ready for infrastructure deployment.

---

# Objectives

The objectives of this phase were to:

* Configure Terraform version requirements.
* Configure the AWS provider.
* Create reusable project variables.
* Define centralized resource tags.
* Configure environment-specific variable values.
* Initialize Terraform.
* Validate the Terraform configuration.

No AWS resources are deployed during this phase.

---

# Project Location

```text
enterprise-aws-platform/
└── terraform/
    └── bootstrap/
```

The `bootstrap` directory will contain the Terraform configuration responsible for provisioning the remote backend used by Terraform.

---

# Files Created

## versions.tf

Defines the required Terraform version and AWS provider version.

Purpose:

* Ensure consistent Terraform versions across all developers.
* Prevent unexpected provider upgrades.
* Improve deployment consistency.

---

## provider.tf

Configures the AWS provider.

Responsibilities:

* Select the AWS provider.
* Configure the deployment region.
* Apply default tags to all AWS resources.

The AWS Region is supplied through a Terraform variable rather than being hardcoded.

---

## variables.tf

Defines reusable project variables.

Variables created:

* aws_region
* project_name
* environment
* owner
* cost_center

Using variables improves portability and allows the same Terraform configuration to be reused across multiple environments.

---

## locals.tf

Defines reusable local values.

A centralized collection of resource tags was created.

Every AWS resource provisioned through this provider will automatically inherit these tags.

Benefits include:

* Improved governance
* Consistent tagging
* Simplified cost allocation
* Easier resource management

---

## terraform.tfvars

Stores the values assigned to project variables.

The following values were configured:

* AWS Region
* Project Name
* Environment
* Project Owner
* Cost Center

Separating variable definitions from variable values follows Terraform best practices.

---

## main.tf

Created as the future location for AWS resource definitions.

No infrastructure resources have been added yet.

---

## outputs.tf

Created as the future location for Terraform outputs.

No outputs are defined during this phase.

---

# Terraform Initialization

The project was initialized using:

```bash
terraform init
```

Terraform successfully:

* Downloaded the AWS provider.
* Created the provider lock file.
* Created the local `.terraform` working directory.

---

# Configuration Validation

The configuration was validated using:

```bash
terraform validate
```

Validation completed successfully.

Result:

```text
Success! The configuration is valid.
```

This confirms that:

* Variable references are valid.
* Provider configuration is correct.
* Local values resolve correctly.
* Terraform syntax is valid.

---

# Lessons Learned

Several Terraform best practices were established during this phase:

* Infrastructure code should be modular and reusable.
* Variables should be defined separately from their values.
* Provider versions should be pinned.
* Common tags should be centralized using local values.
* Configuration should always be validated before deployment.

---

# Deliverables

Completed deliverables include:

* Terraform project structure
* Terraform version configuration
* AWS provider configuration
* Variable definitions
* Local values
* Variable values
* Terraform initialization
* Successful configuration validation

---

# Next Phase

The next phase provisions the Terraform remote backend.

Resources to be created include:

* AWS KMS Key
* Amazon S3 bucket
* S3 versioning
* S3 public access block
* DynamoDB table for state locking

These resources will enable Terraform to securely manage its state in AWS using enterprise best practices.
