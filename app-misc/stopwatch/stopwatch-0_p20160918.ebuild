# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT=9c1381fb5f3bf9337cb0f672d9f3c2ee627ba0a9

DESCRIPTION="Primitive interactive CLI stopwatch"
HOMEPAGE="https://github.com/vthriller/stopwatch"
SRC_URI="https://github.com/vthriller/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python"
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	mkdir -p ${D}/usr/bin/
	cp stopwatch ${D}/usr/bin/
}
