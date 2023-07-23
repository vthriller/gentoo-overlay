# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8,9,10,11,12} )

inherit distutils-r1

DESCRIPTION="Xonsh jupyter kernel"
HOMEPAGE="https://github.com/xonsh/xontrib-jupyter"
SRC_URI="https://github.com/xonsh/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-shells/xonsh[${PYTHON_USEDEP}]
	dev-python/jupyter-client[${PYTHON_USEDEP}]
"
BDEPEND="
"
