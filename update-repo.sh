#!/bin/bash
# update-repo.sh: Generates/Updates RPM metadata

REPO_DIR=$(dirname "$(readlink -f "$0")")

if ! command -v createrepo_c >/dev/null 2>&1 && ! command -v createrepo >/dev/null 2>&1; then
    echo "Error: createrepo_c or createrepo is not installed."
    exit 1
fi

echo "Updating repository metadata in $REPO_DIR..."

# Use createrepo_c if available, else fallback to createrepo
if command -v createrepo_c >/dev/null 2>&1; then
    createrepo_c "$REPO_DIR"
else
    createrepo "$REPO_DIR"
fi

echo "Done. Push these files to GitHub Pages to host the repo."
