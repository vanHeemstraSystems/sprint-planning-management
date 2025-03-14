#!/bin/bash

echo "🧹 Starting cleanup..."

# Clean local OpenTofu files
echo "Cleaning local OpenTofu files..."
rm -rf .terraform
rm -f .terraform.lock.hcl

# Initialize OpenTofu
echo "Initializing OpenTofu..."
tofu init

# Remove resources from state if they exist
echo "Removing resources from state if they exist..."
tofu state rm spacelift_stack.main 2>/dev/null || true
tofu state rm spacelift_context.main 2>/dev/null || true
tofu state rm spacelift_policy.main 2>/dev/null || true
tofu state rm spacelift_context_attachment.main 2>/dev/null || true
tofu state rm spacelift_policy_attachment.main 2>/dev/null || true

# Verify credentials using terraform.tfvars
echo "Verifying Spacelift credentials..."
if tofu plan -var-file="terraform.tfvars" -target=spacelift_stack.main >/dev/null 2>&1; then
    echo "✅ Cleanup complete! You can now run:"
    echo "tofu plan    # to see changes"
    echo "tofu apply   # to apply changes"
else
    echo "❌ Error: Could not verify Spacelift credentials"
    echo "Please check your terraform.tfvars file"
    exit 1
fi
