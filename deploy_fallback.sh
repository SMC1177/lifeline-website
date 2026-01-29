#!/bin/bash

# Script to deploy fallback configuration to Netlify
echo "Deploying fallback configuration to Netlify..."

# Check if netlify CLI is installed
if ! command -v netlify &> /dev/null; then
    echo "Error: Netlify CLI is not installed."
    echo "Please install it with: npm install -g netlify-cli"
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository. Please initialize git first."
    exit 1
fi

# Add the new files to git
echo "Adding new files to git..."
git add netlify.toml website/404.html

# Commit the changes
echo "Committing changes..."
git commit -m "Add fallback configuration for www.smacktax.com

- Added 404.html redirect page
- Updated netlify.toml with error handling redirects
- Configured fallback to https://chimerical-nasturtium-99ddfa.netlify.app"

# Push to origin (assuming this triggers Netlify deploy)
echo "Pushing to origin..."
git push origin main

echo "Deployment complete! The fallback configuration has been deployed."
echo ""
echo "What this does:"
echo "- 404 errors will show a custom redirect page that automatically redirects to your fallback site"
echo "- 500 errors will redirect directly to your fallback site"
echo "- Any other errors can be handled by visiting /error which redirects to fallback"
echo ""
echo "Test by visiting: https://www.smacktax.com/nonexistent-page"