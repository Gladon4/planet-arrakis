#!/usr/bin/env bash
set -e

# Get version
VERSION=$(jq -r '.version' info.json)
ARCHIVE_NAME="planet-arrakis_${VERSION}"
ZIP_NAME="${ARCHIVE_NAME}.zip"

# Temp staging directory
STAGING_DIR=$(mktemp -d)

# Create target folder inside staging
TARGET_DIR="${STAGING_DIR}/${ARCHIVE_NAME}"
mkdir -p "$TARGET_DIR"
echo "$ARCHIVE_NAME"

# Copy everything except excluded stuff
rsync -a . "$TARGET_DIR" \
  --exclude "graphics/basefiles/*" \
  --exclude ".*" \
  --exclude "$(basename "$STAGING_DIR")" \
  --exclude "build.sh" \
  --exclude "*.md" \

# Create zip from staging folder
(
  cd "$STAGING_DIR"
  zip -r "$ZIP_NAME" "$ARCHIVE_NAME"
)

# Move zip back to original directory
mv "$STAGING_DIR/$ZIP_NAME" ~/.factorio/mods/

# Cleanup
rm -rf "$STAGING_DIR"


echo "Created $ZIP_NAME"