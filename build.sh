#!/bin/bash
set -e

echo "=== Building Cockpit Tools for Lazycat MicroServer ==="

# Install dependencies (including devDependencies for build)
echo "Installing dependencies..."
npm ci

# Build the frontend
echo "Building frontend..."
npm run build

echo "=== Build completed ==="
