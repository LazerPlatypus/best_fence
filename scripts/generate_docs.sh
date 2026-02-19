#!/usr/bin/env bash
# Generate API documentation using openscad-docsgen
# Automatically detects venv installation or uses system installation

set -e

VENV_DIR=".venv"
DOCS_DIR="docs/api"
DIRS="assemblies,hardware,parts,tools"

# Find openscad-docsgen (venv first, then system)
if [ -x "$VENV_DIR/bin/openscad-docsgen" ]; then
    DOCSGEN="$VENV_DIR/bin/openscad-docsgen"
    echo "Using openscad-docsgen from venv"
elif command -v openscad-docsgen &> /dev/null; then
    DOCSGEN="openscad-docsgen"
    echo "Using system openscad-docsgen"
else
    echo "❌ openscad-docsgen not found"
    echo ""
    echo "Install with:"
    echo "  make setup    # or ./scripts/setup.sh"
    echo ""
    echo "Or install globally:"
    echo "  https://github.com/BelfrySCAD/openscad_docsgen"
    exit 1
fi

echo "Generating API documentation..."
mkdir -p "$DOCS_DIR"

IFS=',' read -ra DIR_LIST <<< "$DIRS"
for dir in "${DIR_LIST[@]}"; do
    if [ -d "$dir" ] && ls "$dir"/*.scad 1> /dev/null 2>&1; then
        $DOCSGEN -m "$dir"/*.scad --force
    fi
done

echo "✓ Documentation generated in $DOCS_DIR/"
