# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple XLib program to highlight the cursor position."
HOMEPAGE="https://github.com/arp242/find-cursor"
SRC_URI="https://github.com/arp242/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11 x11-libs/libXext x11-libs/libXfixes"
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	sed -i -e "s/\`git tag | tail -1 | tr -d v\`/${PV}/" Makefile

	default
}

src_install() {
	MANPREFIX="${EPREFIX}/usr/share/man"
	mkdir -p "${D}${MANPREFIX}/man1"
	emake PREFIX="${EPREFIX}/usr" MANPREFIX="${MANPREFIX}" DESTDIR="${D}/" install
}
