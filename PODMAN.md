# Podman

Here's a guide to install and use Podman on macOS:

1. Installation using Homebrew:

```
brew install podman
```

2. Initialize and start the Podman service:

```
podman machine init  # Create a new VM
podman machine start  # Start the VM
```

3. Basic Commands:

```
# Pull an image
podman pull nginx

# List images
podman images

# Run a container
podman run -d -p 8080:80 nginx

# List running containers
podman ps

# Stop a container
podman stop <container_id>

# Remove a container
podman rm <container_id>

# Remove an image
podman rmi <image_name>

# Clean up unused resources
podman system prune
```

4. Docker Compatibility:

Podman is designed to be compatible with Docker, allowing you to use most Docker commands with Podman.

Create an alias in your ~/.zshrc or ~/.bash_profile:

```
alias docker=podman
```

5. Using Podman Compose:

```
brew install podman-compose

# Run docker-compose files
podman-compose up -d
```

6. Managing the Podman Machine:

```
# Check machine status
podman machine list

# Stop the machine
podman machine stop

# Remove the machine
podman machine rm

# View machine logs
podman machine logs

# Check machine status
podman machine status

# Access machine via SSH
podman machine ssh
```

7. Configure Resources:

```
podman machine set --cpus 4 --memory 4096
```

8. Connect to Podman:

```
# Get connection info
podman info

# Connect to container shell
podman exec -it <container_id> /bin/bash
```

9. Podman Desktop:

Podman Desktop provides a GUI alternative to Docker Desktop with lower resource consumption.

```
# Install Podman Desktop
brew install --cask podman-desktop

# Or download from:
# https://podman-desktop.io/
```

Key benefits of Podman Desktop:
- Lower memory footprint than Docker Desktop
- Native support for rootless containers
- Compatible with Docker Compose files
- Built-in container and image management
- Integration with multiple container engines
