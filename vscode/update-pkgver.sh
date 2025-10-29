#!/bin/bash
set -e

echo "🔍 Getting the latest stable version of VS Code..."
ver=$(curl -s https://update.code.visualstudio.com/api/releases/stable | grep -oE '"v?[0-9]+(\.[0-9]+)*"' | head -n1 | sed 's/[\"v]//g')

echo "📦 Updating pkgver=${ver} en PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD

echo "✅ Versión updated: ${ver}"

