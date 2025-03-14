terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

# Configure the Spacelift provider
provider "spacelift" {
  api_key_endpoint = var.spacelift_api_key_endpoint
  api_key_id      = var.spacelift_api_key_id
  api_key_secret  = var.spacelift_api_key_secret
}

# Debug outputs (without current_stack)
output "debug_info" {
  value = {
    api_endpoint  = coalesce(var.spacelift_api_key_endpoint, "default")
    workspace     = coalesce(var.spacelift_workspace_root, "default")
  }
}

# Add variables for debugging
variable "spacelift_api_key_endpoint" {
  type = string
}

variable "spacelift_api_key_id" {
  type = string
}

variable "spacelift_api_key_secret" {
  type      = string
  sensitive = true
}

variable "spacelift_workspace_root" {
  type    = string
  default = null
}

# Create resources (not data sources)
resource "spacelift_stack" "main" {
  name        = "template-default-repository-spacelift-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  repository  = "template-default-repository"
  branch      = "main"
  description = "React application deployment stack (Spacelift managed)"

  runner_image = "node:20"
  
  administrative = true
  autodeploy     = true

  labels = [
    "react",
    "frontend",
    "github-pages",
    "spacelift-managed"
  ]

  # Add path setting and recursive flag
  project_root = "."
  manage_state = true
  
  # Enable local preview
  enable_local_preview = true
}

resource "spacelift_context" "main" {
  name        = "template-default-repository-context-spacelift-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  description = "Shared configuration for React application (Spacelift managed)"
}

resource "spacelift_policy" "main" {
  name        = "template-default-repository-policy-spacelift-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  description = "Shared configuration for React application (Spacelift managed)"
  body        = file("${path.module}/policies/main.rego")
  type        = "PLAN"
}

resource "spacelift_context_attachment" "main" {
  context_id = spacelift_context.main.id
  stack_id   = spacelift_stack.main.id
}

resource "spacelift_policy_attachment" "main" {
  policy_id = spacelift_policy.main.id
  stack_id  = spacelift_stack.main.id
}
