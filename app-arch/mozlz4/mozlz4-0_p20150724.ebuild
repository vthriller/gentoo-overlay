# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MozLz4a compression/decompression utility"
HOMEPAGE="https://gist.github.com/Tblue/62ff47bef7f894e92ed5"
SRC_URI="https://gist.githubusercontent.com/Tblue/62ff47bef7f894e92ed5/raw/2483756c55ed34be565aea269f05bd5eeb6b0a33/mozlz4a.py -> mozlz4"

S="${WORKDIR}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/lz4"
DEPEND="${RDEPEND}"
BDEPEND=""

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
}

src_install() {
	dobin mozlz4
}
