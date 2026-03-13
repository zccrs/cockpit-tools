#!/bin/bash
set -e

echo "=== Building Cockpit Tools for Lazycat MicroServer ==="

# Install dependencies
echo "Installing dependencies..."
npm ci --production

# Build the frontend
echo "Building frontend..."
npm run build

echo "=== Build completed ==="
