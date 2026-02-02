#!/usr/bin/env bash
# Helper script to build a Linux bundle using Docker.
# Usage (on Windows with Docker Desktop or WSL):
#   ./packaging/build.sh /absolute/path/to/output_dir
set -euo pipefail
OUTDIR=${1:-$(pwd)/dist_linux}
mkdir -p "$OUTDIR"

# Build image
docker build -t workbook-builder:latest -f packaging/Dockerfile .

# Run container and copy out the dist contents
CONTAINER=$(docker create workbook-builder:latest)

docker cp "$CONTAINER":/app/dist/workbook "$OUTDIR/" || true
docker cp "$CONTAINER":/app/dist_app.tar.gz "$OUTDIR/" || true

docker rm "$CONTAINER"

echo "Build artifacts copied to: $OUTDIR"
