#!/bin/bash
set -e

echo "🔍 Obteniendo última versión estable de Opera..."
ver=$(curl -s https://rpm.opera.com/rpm/ \
  | grep -oE 'opera_stable-[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+-linux-release-x64-signed\.rpm' \
  | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -Vu | tail -n1)

if [[ -z "$ver" ]]; then
  echo "❌ No se pudo obtener la versión."
  exit 1
fi

echo "📦 Actualizando pkgver=${ver} en PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${ver}/" PKGBUILD
echo "✅ Versión actualizada: ${ver}"
