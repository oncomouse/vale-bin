# Maintainer: Andrew Pilsch < oncomouse AT gmail DOT com >
pkgname=vale-bin
_pkgname=vale
pkgver=2.10.5
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

sha256sums=(5caac074535c459f6e35f5accfd7094d04c2a3034e6ba5c69c33e5d1c3b301a8
631d478b9cbc45c5bfa3a52b66b9ea9cfbaac17482d54182326cf15941788e4a
61c1df7724b98554d3bdd196d52c793c432e90aae4022f0f3ceebec1ff111c72)

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
