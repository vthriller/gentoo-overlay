# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT=10674328e5f058ceff8fcad5398e9d2c489a647a

DESCRIPTION="Visual Bell for X11"
HOMEPAGE="https://github.com/rianhunter/xvisbell"
SRC_URI="https://github.com/rianhunter/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	mkdir -p ${D}/usr/bin/
	cp xvisbell ${D}/usr/bin/
}
