# enterprise-aws-platform
# Enterprise AWS Platform

## Overview

Enterprise AWS Platform is a production-grade cloud infrastructure project built entirely with Terraform on AWS.

The goal of this project is to design, build, secure, monitor, and automate an enterprise cloud environment following AWS and Terraform best practices while keeping deployment costs as close to zero as possible.

The project simulates a real-world consulting engagement where an organization is migrating to AWS and requires a secure, scalable, and well-governed cloud platform.

## Objectives

- Build a production-ready AWS platform
- Implement Infrastructure as Code using Terraform
- Enforce governance and security best practices
- Design secure networking
- Deploy containerized applications on Amazon ECS
- Implement centralized monitoring and logging
- Automate deployments using GitHub Actions
- Produce enterprise-quality documentation

## Technology Stack

- AWS
- Terraform
- GitHub
- GitHub Actions
- Visual Studio Code
- AWS CLI

## AWS Region

```
us-east-1
```

## Project Structure

```
enterprise-aws-platform/
│
├── docs/
├── terraform/
├── scripts/
├── diagrams/
├── .github/
├── README.md
└── .gitignore
```

## Documentation

Each phase of the project contains:

- Business Requirements
- Architecture
- Implementation
- Validation
- Troubleshooting
- Best Practices

## Project Status

**Current Phase:** Project Foundation
# Enterprise AWS Platform

## Enterprise Implementation Handbook

---

# Chapter 1 - Preparing the Development Environment

## Learning Objectives

By the end of this chapter you will be able to:

* Create the project repository.
* Clone the repository locally.
* Open the project in Visual Studio Code.
* Create the enterprise project structure.
* Configure Terraform.
* Validate the Terraform configuration.
* Commit the initial project to GitHub.

---

# Business Scenario

Lina Financial Services has decided to standardize all cloud infrastructure using Infrastructure as Code (IaC). Before any AWS resources can be provisioned, the Cloud Platform Engineering team must establish a consistent project structure, configure Terraform, and prepare the development environment.

This chapter establishes the foundation that will be used throughout the remainder of the project.

---

# Prerequisites

Install the following software before beginning:

* Git
* Visual Studio Code
* Terraform
* AWS CLI

---

# Step 1 - Verify the Installed Software

Open **PowerShell**.

Verify Git.

```powershell
git --version
```

Expected output:

```text
git version 2.x.x
```

Verify Terraform.

```powershell
terraform version
```

Expected output:

```text
Terraform v1.x.x
```

Verify AWS CLI.

```powershell
aws --version
```

Expected output:

```text
aws-cli/2.x.x
```

---

# Step 2 - Create the GitHub Repository

1. Open GitHub.
2. Click **New Repository**.
3. Repository name:

```text
enterprise-aws-platform
```

4. Select **Public**.
5. Click **Create Repository**.

---

# Step 3 - Clone the Repository

Open PowerShell.

Navigate to the directory where you keep your projects.

Example:

```powershell
cd C:\Users\paddah
```

Clone the repository.

```powershell
git clone https://github.com/paulinaaddah/enterprise-aws-platform.git
```

Move into the project.

```powershell
cd enterprise-aws-platform
```

Open the project in Visual Studio Code.

```powershell
code .
```

Expected result:

Visual Studio Code opens the project.

---

# Step 4 - Create the Project Structure

Inside Visual Studio Code:

Right-click **enterprise-aws-platform**

Select **New Folder**

Create:

```text
.github
```

Open `.github`.

Create:

```text
workflows
```

Go back to the project root.

Create the following folders one by one.

```text
docs
```

```text
diagrams
```

```text
scripts
```

```text
terraform
```

Open the **terraform** folder.

Create:

```text
bootstrap
```

```text
modules
```

```text
environments
```

```text
global
```

The project should now look like this:

```text
enterprise-aws-platform/
│
├── .github/
│   └── workflows/
│
├── diagrams/
├── docs/
├── scripts/
│
├── terraform/
│   ├── bootstrap/
│   ├── environments/
│   ├── global/
│   └── modules/
│
├── README.md
└── .gitignore
```

---

# Step 5 - Create the Bootstrap Files

Open:

```text
terraform/bootstrap
```

Create the following files.

```text
versions.tf
```

```text
provider.tf
```

```text
variables.tf
```

```text
locals.tf
```

```text
main.tf
```

```text
outputs.tf
```

```text
terraform.tfvars
```

Do not add any code yet.

---

# Step 6 - Configure Terraform

Open:

```text
terraform/bootstrap/versions.tf
```

Paste:

```hcl
terraform {

  required_version = ">= 1.8.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.100"

    }

  }

}
```

Continue with:

* provider.tf
* variables.tf
* locals.tf
* terraform.tfvars

using the configurations created during this project.

---

# Step 7 - Initialize Terraform

Open the VS Code terminal.

Navigate to the bootstrap directory.

```powershell
cd terraform/bootstrap
```

Initialize Terraform.

```powershell
terraform init
```

Expected output:

```text
Terraform has been successfully initialized!
```

---

# Step 8 - Validate the Configuration

Run:

```powershell
terraform validate
```

Expected output:

```text
Success! The configuration is valid.
```

---

# Step 9 - Configure Git

Create the `.gitignore` file.

Ensure it excludes:

* `.terraform/`
* `*.tfstate`
* `*.tfstate.*`

Ensure it includes:

```text
.terraform.lock.hcl
```

---

# Step 10 - Commit the Project

From the project root run:

```powershell
git add .
```

```powershell
git status
```

Verify that `.terraform/` is **not** listed.

Commit the project.

```powershell
git commit -m "Phase 2: Configure Terraform bootstrap project"
```

Push the repository.

```powershell
git push origin main
```

---

# Validation Checklist

At the end of this chapter confirm:

* Git installed
* Terraform installed
* AWS CLI installed
* Repository cloned
* Project structure created
* Terraform configured
* Terraform initialized
* Terraform validated
* GitHub repository updated

---

# Next Chapter

Chapter 2 begins by provisioning the Terraform remote backend using:

* AWS KMS
* Amazon S3
* DynamoDB
# Git Commit Convention

## Why We Use a Commit Convention

As this project grows, hundreds of commits will be made. A consistent commit message format makes the project easier to understand, review, troubleshoot, and maintain.

Instead of describing the file that changed, each commit describes **the type of work that was completed**.

For example, if `README.md` is updated with a new chapter, the commit is not named after the file. Instead, it describes the work performed.

Example:

```bash
git commit -m "docs: add Chapter 1 - Preparing the Development Environment"
```

This immediately tells every contributor that the commit contains documentation changes.

---

# Conventional Commit Format

The project follows the Conventional Commits specification.

General format:

```text
<type>: <short description>
```

Example:

```text
docs: add Chapter 2 - Terraform Bootstrap
```

---

# Commit Types Used in This Project

| Type       | Purpose                                              | Example                                     |
| ---------- | ---------------------------------------------------- | ------------------------------------------- |
| `feat`     | Introduces a new feature or infrastructure component | `feat: add VPC module`                      |
| `fix`      | Fixes a bug or configuration issue                   | `fix: correct IAM trust policy`             |
| `docs`     | Adds or updates documentation                        | `docs: add Chapter 3 - Terraform Bootstrap` |
| `refactor` | Improves code without changing functionality         | `refactor: simplify Terraform modules`      |
| `ci`       | Updates Continuous Integration or GitHub Actions     | `ci: add Terraform validation workflow`     |
| `test`     | Adds or updates tests                                | `test: add Terraform validation tests`      |
| `chore`    | Repository maintenance or housekeeping               | `chore: update .gitignore`                  |
| `security` | Improves the security posture of the platform        | `security: enable S3 bucket encryption`     |

---

# Examples

Adding a new Terraform module:

```bash
git commit -m "feat: add VPC module"
```

Updating documentation:

```bash
git commit -m "docs: add Chapter 4 - Remote Backend"
```

Correcting a Terraform configuration issue:

```bash
git commit -m "fix: correct S3 bucket policy"
```

Adding a GitHub Actions workflow:

```bash
git commit -m "ci: add Terraform plan workflow"
```

Updating the `.gitignore` file:

```bash
git commit -m "chore: update .gitignore"
```

Enabling encryption on an S3 bucket:

```bash
git commit -m "security: enable KMS encryption for Terraform state bucket"
```

---

# Benefits

Using a consistent commit convention provides several advantages:

* Makes the Git history easy to read.
* Clearly communicates the purpose of each commit.
* Simplifies code reviews.
* Helps identify infrastructure, documentation, security, and maintenance changes.
* Follows industry-standard engineering practices used by many enterprise software teams.

This convention will be followed throughout the Enterprise AWS Platform project.
# Chapter 2 - Building the Terraform Remote Backend

## Learning Objectives

By the end of this chapter, you will be able to:

* Understand why Terraform requires a remote backend.
* Provision a customer-managed AWS KMS key.
* Create an Amazon S3 bucket to store the Terraform state.
* Enable S3 bucket versioning.
* Configure server-side encryption using AWS KMS.
* Block all forms of public access to the S3 bucket.
* Create a DynamoDB table for state locking.
* Configure Terraform to use the remote backend.
* Validate the backend configuration.

---

# Business Scenario

The Cloud Platform Engineering team has completed the local Terraform project configuration.

At the moment, Terraform stores its state file (`terraform.tfstate`) on the engineer's local computer. While this approach is acceptable for learning purposes, it is not suitable for enterprise environments where multiple engineers collaborate on the same infrastructure.

The organization has therefore decided to implement a centralized, secure, and highly available remote backend to store Terraform state.

This backend will provide:

* A single source of truth for infrastructure state.
* Encryption of state data using AWS KMS.
* Automatic versioning of the state file.
* Protection against accidental public access.
* State locking to prevent concurrent infrastructure changes.

---

# Why Not Store Terraform State Locally?

When Terraform is executed locally, it creates a file named:

```text
terraform.tfstate
```

This file contains the current state of the deployed infrastructure.

Problems with local state include:

* State exists on only one engineer's computer.
* Multiple engineers can overwrite each other's changes.
* State is not automatically backed up.
* Sensitive information may be stored in plaintext.
* Recovery becomes difficult if the workstation is lost or damaged.

For these reasons, enterprise environments use a remote backend.

---

# Target Architecture

```text
                    Terraform
                        │
                        ▼
              Amazon S3 Backend
                        │
        ┌───────────────┴───────────────┐
        ▼                               ▼
 AWS KMS Encryption            Bucket Versioning
                        │
                        ▼
              DynamoDB State Lock
```

---

# Implementation Roadmap

This chapter will be completed in the following order:

| Step | Activity                        |
| ---- | ------------------------------- |
| 1    | Create the AWS KMS key          |
| 2    | Create the Amazon S3 bucket     |
| 3    | Enable bucket versioning        |
| 4    | Enable server-side encryption   |
| 5    | Block all public access         |
| 6    | Create the DynamoDB table       |
| 7    | Configure the Terraform backend |
| 8    | Validate the deployment         |

---

# Prerequisites

Before continuing, ensure the following have been completed:

* Chapter 1 completed successfully.
* Terraform initialized successfully.
* `terraform validate` completed without errors.
* AWS CLI configured.
* AWS credentials authenticated.
* Working AWS Region set to `us-east-1`.

---

The next section begins with creating the AWS KMS key, which will be used to encrypt the Terraform state stored in Amazon S3.
