#!/bin/bash
set -e

echo "🔍 Obteniendo última versión estable de Google Chrome..."
ver=$(curl -s https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages \
  | grep -m1 "Version:" | awk '{print $2}' | cut -d'-' -f1)

if [[ -z "$ver" ]]; then
  echo "❌ No se pudo obtener la versión."
  exit 1
fi

echo "📦 Actualizando pkgver=${ver} en PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD
echo "✅ Versión actualizada: ${ver}"

