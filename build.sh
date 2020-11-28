#!/usr/bin/env bash

mkdir tmp

_pkgname="vale"
url="https://github.com/errata-ai/vale"
pkgver=$(git ls-remote --tags ${url} | tail -n 1 | cut -d "/" -f3 | sed -e "s/v//" | tr -d '\n')
source=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/README.md")

IFS="::"
i=1
regex='(.*)::(.*)'
shasums=()
for s in "${source[@]}"; do
  [[ $s =~ $regex ]] || continue
  out=${BASH_REMATCH[1]}
  url=${BASH_REMATCH[2]}
  curl -sLo "tmp/$out" "$url"
  # declare "SHA$1="
  shasums[${#shasums[@]}]="$(shasum -a 256 "tmp/$out" | cut -d " " -f1)"
  ((i = i + 1))
done
echo "$pkgver"
echo "${shasums[0]}"
echo "${shasums[1]}"
echo "${shasums[2]}"
sed -e "s/SHA1/${shasums[0]}/g" -e "s/SHA2/${shasums[1]}/g" -e "s/SHA3/${shasums[2]}/g" -e "s/VERSION/${pkgver}/g" < PKGBUILD.template > PKGBUILD
makepkg --printsrcinfo > .SRCINFO
rm -rf tmp
