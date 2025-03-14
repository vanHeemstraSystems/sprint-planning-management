package spacelift

# Skip ALL manual triggers if there are pending translation commits
skip_run {
    # Skip if ANY recent commit is a translation
    any([
        contains(input.push.commit_message, "translation via"),
        input.push.commit_author == "github-actions[bot]"
    ])
}

# First, check if this is a Spacelift-related change
is_spacelift_file(file) {
    any([
        endswith(file, "main.tf"),
        startswith(file, ".spacelift/"),
        startswith(file, "policies/"),
        endswith(file, "main.rego")
    ])
}

# Allow pushes ONLY for Spacelift-related changes
allow[msg] {
    # Get the list of changed files
    files := input.push.changed_files

    # Allow if ANY file is Spacelift-related
    any([is_spacelift_file(files[_])])

    # And ensure we're not skipping this run
    not skip_run

    msg := sprintf("Changes include Spacelift-managed files: %v", [files])
}

# Block all other changes
deny[msg] {
    not allow
    msg := "Only Spacelift-related changes are allowed"
}

# Define deployment environments
deployment_environment(stack) = "production" {
    stack.branch == "main"
}

# Define access controls
allow_access[msg] {
    input.user.role == "admin"
    msg := "Admin access granted"
}