#!/bin/bash

# ICPC Team Notebook Build Script
# This script compiles the notebook.tex file to PDF using pdflatex with minted

echo "========================================="
echo "Building ICPC Team Notebook..."
echo "========================================="

# Check if pdflatex is installed
if ! command -v pdflatex &> /dev/null
then
    echo "Error: pdflatex is not installed!"
    echo "Please install texlive or mactex first."
    exit 1
fi

# Clean previous builds
echo "Cleaning previous builds..."
rm -f notebook.aux notebook.log notebook.out notebook.toc notebook.pdf
rm -rf _minted-notebook

# Build PDF (needs to run twice for TOC)
echo "First pass..."
pdflatex -shell-escape -interaction=nonstopmode notebook.tex

echo "Second pass (for table of contents)..."
pdflatex -shell-escape -interaction=nonstopmode notebook.tex

# Clean auxiliary files
echo "Cleaning auxiliary files..."
rm -f notebook.aux notebook.log notebook.out notebook.toc
rm -rf _minted-notebook

if [ -f notebook.pdf ]; then
    echo "========================================="
    echo "✓ Build successful!"
    echo "Output: notebook.pdf"
    echo "========================================="
else
    echo "========================================="
    echo "✗ Build failed!"
    echo "Check the error messages above."
    echo "========================================="
    exit 1
fi