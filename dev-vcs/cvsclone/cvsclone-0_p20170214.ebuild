# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT=503936d9f8633c50dc3a1a9b35082f7b66c59c6e

DESCRIPTION="A quick CVS repository leecher"
HOMEPAGE="https://repo.or.cz/w/cvsclone.git"
SRC_URI="https://repo.or.cz/cvsclone.git/snapshot/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT:0:7}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	dobin cvsclone
}
