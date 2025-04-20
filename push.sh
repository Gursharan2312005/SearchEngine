#!/bin/bash

# Navigate to project directory
cd "/e/Search Engine"

# Configure Git
git config --global user.name "Gursharan2312005"
git config --global user.email "your.email@example.com"

# Add all changes
git add .

# Commit changes
git commit -m "Update render.yaml and push script"

# Set remote URL with new authentication
git remote set-url origin https://Gursharan2312005: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@github.com/Gursharan2312005/SearchEngine.git

# Push to GitHub
git push -u origin main 