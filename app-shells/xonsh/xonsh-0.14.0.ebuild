# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11,12} )

inherit distutils-r1

DESCRIPTION="Xonsh ... is a superset of Python 3.6+ with additional shell primitives"
HOMEPAGE="https://xon.sh/"
SRC_URI="https://github.com/xonsh/xonsh/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="ptk pygments"

DEPEND="
	ptk? ( dev-python/prompt-toolkit[${PYTHON_USEDEP}] )
	pygments? ( dev-python/pygments[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPEND}"
BDEPEND=""
