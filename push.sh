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

# Set remote URL with authentication
git remote set-url origin https://Gursharan2312005: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@github.com/Gursharan2312005/SearchEngine.git

# Push to GitHub
git push -u origin main 