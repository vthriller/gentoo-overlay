# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils vcs-snapshot

DESCRIPTION="Very simple layout switcher"
HOMEPAGE="https://github.com/qnikst/kbdd"
SRC_URI="https://github.com/qnikst/kbdd/tarball/v${PV} -> ${PN}-${PV}.tar.gz"

PATCHES=(${FILESDIR}/dowhile.patch)

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus"

DEPEND="dev-libs/glib:2=
	x11-libs/libX11:0=
	dbus? (
		sys-apps/dbus:0=
		>=dev-libs/dbus-glib-0.86:0=
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable dbus)
}
