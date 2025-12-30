#!/usr/bin/env bash

set -e

ARCHIVE="$1"
CUSTOM_NAME="$2"

if [[ -z "$ARCHIVE" ]]; then
  echo "Error: no archive provided"
  echo "Usage: extract <archive-file> [output-folder]"
  exit 1
fi

if [[ ! -f "$ARCHIVE" ]]; then
  echo "Error: file not found -> $ARCHIVE"
  exit 1
fi

# Resolve output folder name
if [[ -n "$CUSTOM_NAME" ]]; then
  FOLDER="$CUSTOM_NAME"
else
  BASENAME="$(basename "$ARCHIVE")"
  FOLDER="${BASENAME%.tar.gz}"
  FOLDER="${FOLDER%.tgz}"
  FOLDER="${FOLDER%.tar}"
  FOLDER="${FOLDER%.zip}"
  FOLDER="${FOLDER%.rar}"
fi

mkdir -p "$FOLDER"

require() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: required tool '$1' is not installed"
    exit 1
  fi
}

case "$ARCHIVE" in
*.zip)
  require unzip
  unzip -q "$ARCHIVE" -d "$FOLDER"
  ;;
*.tar.gz | *.tgz)
  require tar
  tar -xzf "$ARCHIVE" -C "$FOLDER"
  ;;
*.tar)
  require tar
  tar -xf "$ARCHIVE" -C "$FOLDER"
  ;;
*.rar)
  require unrar
  unrar x -o+ "$ARCHIVE" "$FOLDER/" >/dev/null
  ;;
*)
  echo "Error: unsupported archive format"
  exit 1
  ;;
esac

echo
echo "Extraction completed successfully"
