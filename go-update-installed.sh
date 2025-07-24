#!/bin/bash

# Define the GOBIN directory where your tools are installed.
# The default is $HOME/go/bin.
GOBIN=$(go env GOBIN)
if [ -z "$GOBIN" ]; then
    GOBIN=$(go env GOPATH)/bin
fi

echo "Updating all Go tools in $GOBIN..."

# Find all executables in the GOBIN directory
# and loop through them.
for tool_path in "$GOBIN"/*; do
    # Check if the path is a file and is executable.
    if [ -x "$tool_path" ] && [ -f "$tool_path" ]; then
        tool_name=$(basename "$tool_path")

        # Use 'go version -m' to get the module path from the binary.
        # This is a robust way to find the original source path.
        tool_module=$(go version -m "$tool_path" 2>/dev/null | grep 'path' | awk '{print $2}')

        if [ -n "$tool_module" ]; then
            echo "-> Updating $tool_name from $tool_module..."
            go install "$tool_module"@latest
        else
            echo "-> Skipping $tool_name (could not determine module path)."
        fi
    fi
done

echo "Update process finished."
