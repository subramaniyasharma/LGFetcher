#!/bin/bash

# LGFetcher XPI Build Script
# Creates a .xpi file (ZIP archive) with all necessary plugin files

OUTPUT_FILE="lgfetcher-1.2.0.xpi"

# Create a temporary directory for the build
BUILD_DIR=$(mktemp -d)
trap "rm -rf $BUILD_DIR" EXIT

# Copy all necessary files to the build directory
cp manifest.json "$BUILD_DIR/"
cp bootstrap.js "$BUILD_DIR/"
cp icon.svg "$BUILD_DIR/"
cp preferences.xhtml "$BUILD_DIR/"
cp preferences-ui.js "$BUILD_DIR/"
cp preferences-default.js "$BUILD_DIR/"
cp selection.xhtml "$BUILD_DIR/"
cp selection.js "$BUILD_DIR/"

# Create the XPI file (ZIP archive)
cd "$BUILD_DIR"
zip -r "../$OUTPUT_FILE" . -x "*.DS_Store"
cd - > /dev/null

echo "✓ XPI file created: $OUTPUT_FILE"
ls -lh "$OUTPUT_FILE"
