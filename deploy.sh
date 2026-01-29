#!/bin/bash

# Netlify Deployment Script for SmackTax/Lifeline Website
# This script helps you deploy your enhanced website to Netlify

echo "🚀 SmackTax/Lifeline Website Deployment Script"
echo "=============================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Not in a git repository. Please initialize Git first:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    exit 1
fi

echo "✅ Git repository found"

# Add new files
echo "📦 Adding new files to repository..."
git add netlify.toml website/ NETLIFY_DEPLOYMENT_GUIDE.md

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
else
    echo "📝 Committing changes..."
    git commit -m "Add enhanced website with Netlify configuration and deployment guide"
    
    # Check if remote exists
    if git remote get-url origin &> /dev/null; then
        echo "📤 Pushing to remote repository..."
        git push origin main
        echo "✅ Files pushed to repository"
    else
        echo "⚠️  No remote repository found. Please add a remote:"
        echo "   git remote add origin [your-repository-url]"
        echo "   git push -u origin main"
    fi
fi

echo ""
echo "🎯 Next Steps:"
echo "1. Go to https://app.netlify.com"
echo "2. Click 'Add new site' → 'Import an existing project'"
echo "3. Connect your repository"
echo "4. Configure build settings:"
echo "   - Build command: echo 'No build command needed for static site'"
echo "   - Publish directory: website"
echo "5. Deploy your site!"
echo ""
echo "📖 For detailed instructions, see NETLIFY_DEPLOYMENT_GUIDE.md"
echo ""
echo "✨ Your enhanced website is ready for deployment!"