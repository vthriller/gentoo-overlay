# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MozLz4a compression/decompression utility"
HOMEPAGE="https://gist.github.com/kaefer3000/73febe1eec898cd50ce4de1af79a332a"
SRC_URI="https://gist.githubusercontent.com/kaefer3000/73febe1eec898cd50ce4de1af79a332a/raw/a266410033455d6b4af515d7a9d34f5afd35beec/mozlz4a.py -> mozlz4-${PV}"

S="${WORKDIR}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/lz4"
DEPEND="${RDEPEND}"
BDEPEND=""

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}/mozlz4"
}

src_install() {
	dobin mozlz4
}
