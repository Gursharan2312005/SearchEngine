#!/bin/bash

# Navigate to project directory
cd "/e/Search Engine"

# Configure Git
git config --global user.name "Gursharan2312005"
git config --global user.email "your.email@example.com"

# Add all changes
git add .

# Commit changes
git commit -m "Add Dockerfile for Koyeb deployment"

# Push to GitHub
git push origin main 