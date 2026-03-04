#!/bin/bash
set -e

echo "🔍 Getting the latest Insiders version of VS Code..."
# fetch full version (includes -insider)
full=$(curl -s https://update.code.visualstudio.com/api/releases/insider \
    | grep -oE '"[0-9]+(\.[0-9]+)*-insider"' \
    | head -n1 \
    | tr -d '"')

if [ -z "$full" ]; then
    echo "⚠️  Could not determine version, aborting."
    exit 1
fi
# strip suffix for pkgver
ver=${full%-insider}

echo "📦 Updating pkgver=${ver} (full ${full}) in PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD

echo "✅ Version updated: ${ver} (${full})"
