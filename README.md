# Website Deployment Guide

Hi! This guide will help you update your website on GitHub.

## Basic Git Commands

Here are the commands you'll use most often. Open your terminal (or command prompt) in this folder to run them.

### 1. Check Status
See which files have changed:
```bash
git status
```

### 2. Add Changes
Stage all your changes for the next commit:
```bash
git add .
```

### 3. Save Changes (Commit)
Save your changes with a message describing what you did:
```bash
git commit -m "Description of your changes"
```
*Example: `git commit -m "Updated the home page text"`*

### 4. Upload to GitHub (Push)
Send your saved changes to GitHub (this triggers a Netlify deploy):
```bash
git push origin main
```

---

## Troubleshooting

If you get an error, try checking the status first.
If you need to pull changes from GitHub (if you edited files there):
```bash
git pull origin main