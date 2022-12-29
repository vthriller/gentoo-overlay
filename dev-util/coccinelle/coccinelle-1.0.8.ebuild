# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit autotools multilib eutils python-single-r1 bash-completion-r1

DESCRIPTION="Program matching and transformation engine"
HOMEPAGE="http://coccinelle.lip6.fr/"
SRC_URI="https://github.com/coccinelle/coccinelle/archive/1.0.8.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc ocaml +ocamlopt pcre python test vim-syntax"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# ocaml enables ocaml scripting (uses findlib)
CDEPEND=">=dev-lang/ocaml-3.12:=[ocamlopt?]
	dev-ml/sexplib:=[ocamlopt(+)?]
	dev-ml/menhir:=[ocamlopt?]
	dev-ml/camlp4:=[ocamlopt?]
	dev-ml/parmap:=[ocamlopt?]
	ocaml? ( dev-ml/findlib:= )
	pcre? ( dev-ml/pcre-ocaml:=[ocamlopt(+)?] )
	python? ( ${PYTHON_DEPS} )"

RDEPEND="${CDEPEND}
	vim-syntax? ( || ( app-editors/vim app-editors/gvim ) )"

# dev-texlive/texlive-fontsextra contains 'ifsym.sty'
DEPEND="${CDEPEND}
	virtual/pkgconfig
	doc? (
		virtual/latex-base
		dev-texlive/texlive-latexextra
		dev-texlive/texlive-fontsextra
	)"

DOCS=( authors.txt bugs.txt changes.txt credits.txt readme.txt )

RESTRICT="strip !test? ( test )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default

	eautoreconf
	if use python ; then
		# fix python install location
		sed -e "s:\$(LIBDIR)/python:$(python_get_sitedir):" \
			-i Makefile || die
	fi
}

src_configure() {
	econf \
		$(use_enable python) \
		$(use_enable ocaml) \
		$(use_enable pcre) \
		$(use_enable pcre pcre-syntax) \
		$(use_enable ocamlopt opt)
}

src_compile() {
	emake -j1

	if use ocamlopt ; then
		emake all.opt
	else
		emake TARGET_SPATCH=byte-only all-dev
	fi

	if use doc ; then
		VARTEXFONTS="${T}"/fonts emake docs
	fi
}

src_test() {
	emake check
	use python && emake pycocci-check
}

src_install() {
	default

	use doc && dodoc docs/manual/*.pdf
	newbashcomp scripts/spatch.bash_completion spatch

	if use vim-syntax ; then
		newdoc editors/vim/README README-vim
		rm editors/vim/README || die
		insinto /usr/share/vim/vimfiles
		doins -r editors/vim/*
	fi

	use python && python_optimize
}
