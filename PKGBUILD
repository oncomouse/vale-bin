# Maintainer: Andrew Pilsch < oncomouse AT gmail DOT com >
pkgname=vale-bin
_pkgname=vale
pkgver=2.12.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/README.md")

sha256sums=(1c0f393fe0d4aec4868c874f7853861e104787bab930dc2a6b89ede9704de847
631d478b9cbc45c5bfa3a52b66b9ea9cfbaac17482d54182326cf15941788e4a
ad934e0c730f6cfaadfa1de12d0e72e5e9b73207733a4888a89ab4ed6e146027)

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
