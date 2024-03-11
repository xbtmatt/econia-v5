#!/bin/sh

# Move to the repository root.
cd "$(git rev-parse --show-toplevel)"

# Find all .gitignore files and format them.
# echo "Formatting .gitignore files..."
find . -type f -name '.gitignore' | while read file; do
    echo "Formatting $file..."
    python -m gitignoreformatter "$file"
done